#include "common.h"
#include "variables.h"
#include "npc.h"
#include "world/partners.h"
#include "sprite/npc/Fire.h"

#include "world/action/fireball.h"

typedef struct FireballStatus{
    s32 activeFireballIndex;
    s32 activeFireballTime;
    s8 facingLeft;
} FireballStatus;

FireballStatus fireballStatus = {0,0};

// This function seems overcomplicated but it's almost identical to kooper first strike test so I know it works
s32 test_fireball_first_strike(Npc* enemy) {
    f32 xTemp, yTemp, zTemp;
    f32 enemyX, enemyY, enemyZ;
    f32 fireballX, fireballY, fireballZ;
    f32 enemyCollHeight;
    f32 fireballCollHeight;
    f32 enemyCollRadius;
    f32 fireballCollRadius;
    f32 angleToEnemy;
    f32 distToEnemy;

    Npc* fireball;

    if (!fireballStatus.activeFireballIndex) {
        return FALSE;
    }

    fireball = get_npc_by_index(fireballStatus.activeFireballIndex);

    enemyX = enemy->pos.x;
    enemyY = enemy->pos.y;
    enemyZ = enemy->pos.z;

    fireballX = fireball->pos.x;
    fireballY = fireball->pos.y;
    fireballZ = fireball->pos.z;

    enemyCollHeight = enemy->collisionHeight;
    enemyCollRadius = enemy->collisionDiameter * 0.55;

    fireballCollHeight = fireball->collisionHeight;
    fireballCollHeight = fireball->collisionDiameter * 0.8;

    angleToEnemy = atan2(enemyX, enemyZ, fireballX, fireballZ);
    distToEnemy = dist2D(enemyX, enemyZ, fireballX, fireballZ);

    xTemp = fireball->pos.x;
    yTemp = fireball->pos.y;
    zTemp = fireball->pos.z;

    if (npc_test_move_taller_with_slipping(0, &xTemp, &yTemp, &zTemp, distToEnemy, angleToEnemy,
        fireballCollHeight, fireballCollRadius + enemyCollRadius)
    ) {
        return FALSE;
    }

    if (fireballY > enemyY + enemyCollHeight) {
        return FALSE;
    }

    if (enemyY > fireballY + fireballCollHeight) {
        return FALSE;
    }

    fireballX = enemyX - fireballX;
    fireballZ = enemyZ - fireballZ;
    distToEnemy = SQ(fireballX) + SQ(fireballZ);

    if (!(SQ(fireballCollRadius) + SQ(enemyCollRadius) <= distToEnemy)) {
        free_npc_by_index(fireballStatus.activeFireballIndex);
        fireballStatus.activeFireballIndex = NULL;
        return TRUE;
    }
    return FALSE;
}

void fireball_hit_entity(void) {
    Entity* entity;
    Npc* fireballNpc = get_npc_by_index(fireballStatus.activeFireballIndex);

    if (NpcHitQueryColliderID < 0 || !(NpcHitQueryColliderID & COLLISION_WITH_ENTITY_BIT)) {
        fireballNpc->moveSpeed = 0.0f;
        return;
    }

    fireballStatus.activeFireballTime = 30; // Kill fireball on next render
    entity = get_entity_by_index(NpcHitQueryColliderID & ~COLLISION_WITH_ENTITY_BIT);
    entity->flags |= ENTITY_FLAG_PARTNER_COLLISION;

}

void update_collision(Npc* fireballNpc) {
    f32 posX, posY, posZ;
    // check the forward collision for fireball
    #define TEST_COLLISION_AT_ANGLE(testAngle) \
        ( \
        posX = fireballNpc->pos.x, \
        posY = fireballNpc->pos.y, \
        posZ = fireballNpc->pos.z, \
        npc_test_move_taller_with_slipping(COLLISION_CHANNEL_8000, \
            &posX, &posY, &posZ, fireballNpc->moveSpeed, testAngle,  \
            fireballNpc->collisionHeight, fireballNpc->collisionDiameter / 2) \
        )

    if (TEST_COLLISION_AT_ANGLE(fireballNpc->yaw - 20.0f)) {
        fireball_hit_entity();
    }

    if (TEST_COLLISION_AT_ANGLE(fireballNpc->yaw + 20.0f)) {
        fireball_hit_entity();
    }

    if (TEST_COLLISION_AT_ANGLE(fireballNpc->yaw)) {
        fireball_hit_entity();
    }

}

void on_fireball_render(Npc* fireballNpc) {
    if(fireballStatus.activeFireballTime < 30) {
        fireballStatus.activeFireballTime++;
        fireballNpc->rotation.z += 30.0f;
        update_collision(fireballNpc);
        npc_move_heading(fireballNpc, fireballNpc->moveSpeed, fireballNpc->yaw);
        suggest_player_anim_always_forward(ANIM_Mario1_Throw);
    }
    else {
        free_npc_by_index(fireballStatus.activeFireballIndex);
        fireballStatus.activeFireballIndex = NULL;

        enable_player_input();
        suggest_player_anim_always_forward(ANIM_Mario1_Idle);
    }
}

void use_fireball(void){
    NpcBlueprint sp10;
    NpcBlueprint* bp = &sp10;
    Npc* fireballNpc;
    NpcSettings npcSettings;
    NpcData npcData;

    PlayerStatus* playerStatus = &gPlayerStatus;

    f32 playerPosX, playerPosY, playerPosZ, initialDistanceX, moveAngle;

    if(!player_has_key_item(ITEM_FIREBALL)) {
        return;
    }

    if (fireballStatus.activeFireballIndex) {
        return;
    }

    disable_player_input();

    playerPosX = playerStatus->position.x;
    playerPosY = playerStatus->position.y;
    playerPosZ = playerStatus->position.z;

    npcSettings.defaultAnim = ANIM_Fire_Brighest_Burn;
    npcSettings.height = 12;
    npcSettings.radius = 32;

    npcData.id = 69;
    npcData.init = (void*) 0x00004003;
    npcData.settings = &npcSettings;
    //npcData.animations = {};

     // create the new NPC
    bp->flags = 0;
    bp->initialAnim = npcSettings.defaultAnim;
    bp->onRender = on_fireball_render;
    bp->onUpdate = NULL;

    fireballStatus.activeFireballTime = 0;
    fireballStatus.activeFireballIndex = create_basic_npc(bp);
    fireballStatus.facingLeft = partner_force_player_flip_done();

    fireballNpc = get_npc_by_index(fireballStatus.activeFireballIndex);
    disable_npc_shadow(fireballNpc);
    fireballNpc->scale.x = 0.7f;
    fireballNpc->scale.y = 0.7f;
    fireballNpc->scale.x = 0.7f;
    fireballNpc->npcID = npcData.id;
    fireballNpc->collisionDiameter = npcSettings.radius;
    fireballNpc->collisionHeight = npcSettings.height;
    fireballNpc->unk_96 = 0;
    fireballNpc->planarFlyDist = 0.0f;
    fireballNpc->flags = NPC_FLAG_IGNORE_PLAYER_COLLISION | NPC_FLAG_IGNORE_WORLD_COLLISION | NPC_FLAG_8;

    initialDistanceX = fireballStatus.facingLeft ? -25.0f : 25.0f;

    fireballNpc->moveToPos.x = playerStatus->position.x;
    fireballNpc->moveToPos.y = playerStatus->position.y;
    fireballNpc->moveToPos.z = playerStatus->position.z;
    fireballNpc->moveSpeed = 5.0f;
    fireballNpc->yaw = playerStatus->targetYaw;

    fireballNpc->pos.x = playerPosX + initialDistanceX;
    fireballNpc->pos.y = playerPosY + 10.0f;
    fireballNpc->pos.z = playerPosZ;

    fireballNpc->rotation.z = 0.0f;
    fireballNpc->rotationPivotOffsetY = 10.0f;

    sfx_play_sound_at_player(SOUND_E8, SOUND_SPACE_MODE_0);
}


