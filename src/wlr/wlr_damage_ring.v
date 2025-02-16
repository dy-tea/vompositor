module wlr

import pixman

#flag linux -I/usr/include
#flag linux -I/usr/include/pixman-1
#flag linux -I/usr/include/wayland-protocols
#flag -I @VMODROOT
#flag linux -I/usr/include/wlroots-0.19
#flag linux -lwayland-server
#flag linux -lwlroots-0.19
#flag linux -DWLR_USE_UNSTABLE

#include "wlr/types/wlr_damage_ring.h"

pub struct C.wlr_damage_ring_buffer {
	buffer &C.wlr_buffer
	damage C.pixman_region32_t

	ring &C.wlr_damage_ring
	link C.wl_list

	WLR_PRIVATE struct {
		destroy C.wl_listener
	}
}

pub struct C.wlr_damage_ring {
	current C.pixman_region32_t

	WLR_PRIVATE struct {
		buffers C.wl_list
	}
}

pub fn C.wlr_damage_ring_init(ring &C.wlr_damage_ring)
pub fn C.wlr_damage_ring_finish(ring &C.wlr_damage_ring)

pub fn C.wlr_damage_ring_add(ring &C.wlr_damage_ring, damage &C.pixman_region32_t)
pub fn C.wlr_damage_ring_add_box(ring &C.wlr_damage_ring, box &C.wlr_box)
pub fn C.wlr_damage_ring_add_whole(ring &C.wlr_damage_ring)

pub fn C.wlr_damage_ring_rotate_buffers(ring &C.wlr_damage_ring, buffer &C.wlr_buffer, damage &C.pixman_region32_t)
