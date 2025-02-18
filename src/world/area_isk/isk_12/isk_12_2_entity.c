#include "isk_12.h"
#include "entity.h"
#include "effects.h"

EvtScript N(EVS_SmashBlock_Stone) = {
    EVT_SET(GF_ISK12_Hammer2Block, TRUE)
    EVT_RETURN
    EVT_END
};

EvtScript N(EVS_MakeEntities) = {
    EVT_IF_EQ(GF_ISK12_Hammer2Block, FALSE)
        EVT_CALL(MakeEntity, EVT_PTR(Entity_Hammer2Block), 627, -840, 135, 75, MAKE_ENTITY_END)
        EVT_CALL(AssignScript, EVT_PTR(N(EVS_SmashBlock_Stone)))
    EVT_END_IF
    EVT_PLAY_EFFECT(EFFECT_FLAME, 1, 415, -453, 291, EVT_FLOAT(0.3), LVar0)
    EVT_PLAY_EFFECT(EFFECT_FLAME, 1, 505, -453, 44, EVT_FLOAT(0.3), LVar0)
    EVT_PLAY_EFFECT(EFFECT_FLAME, 1, 415, -643, 291, EVT_FLOAT(0.3), LVar0)
    EVT_PLAY_EFFECT(EFFECT_FLAME, 1, 505, -643, 44, EVT_FLOAT(0.3), LVar0)
    EVT_PLAY_EFFECT(EFFECT_FLAME, 1, 417, -643, 196, EVT_FLOAT(0.3), LVar0)
    EVT_PLAY_EFFECT(EFFECT_FLAME, 1, 444, -643, 120, EVT_FLOAT(0.3), LVar0)
    EVT_CALL(MakeItemEntity, ITEM_RUINS_KEY, 461, -760, 109, ITEM_SPAWN_MODE_KEY, GF_ISK12_Item_RuinsKey)
    EVT_RETURN
    EVT_END
};
