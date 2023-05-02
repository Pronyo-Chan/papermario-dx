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
    }

    if (TEST_COLLISION_AT_ANGLE(fireballNpc->yaw + 20.0f)) {
    }

    if (TEST_COLLISION_AT_ANGLE(fireballNpc->yaw)) {
    }

}

void on_fireball_render(Npc* fireballNpc) {
    if(fireballStatus.activeFireballTime < 30) {
        fireballStatus.activeFireballTime++;
        fireballNpc->rotation.z += 30.0f;
        update_collision(fireballNpc);
        npc_move_heading(fireballNpc, fireballNpc->moveSpeed, fireballNpc->yaw);

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

    if (fireballStatus.activeFireballIndex) {
        return;
    }

    disable_player_input();

    playerPosX = playerStatus->position.x;
    playerPosY = playerStatus->position.y;
    playerPosZ = playerStatus->position.z;

    npcSettings.defaultAnim = ANIM_Fire_Brighest_Burn;
    npcSettings.height = 12;
    npcSettings.radius = 20;

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
    fireballNpc->flags = NPC_FLAG_IGNORE_PLAYER_COLLISION;

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
    suggest_player_anim_allow_backward(ANIM_Mario1_Throw);
}


