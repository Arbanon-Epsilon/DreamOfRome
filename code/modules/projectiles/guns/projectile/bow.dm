//ROMAN

/obj/item/gun/projectile/bow
	name = "composite bow"
	desc = "A standard composite bow of most of the militaries of this era. Nothing remarkable about it."
	icon_state = "compositebow"
	item_state = "compositebow"
	w_class = ITEM_SIZE_LARGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	caliber = "arrow" //yea...
	screen_shake = 0 //no kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SINGLE_LOAD
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/arrow
	one_hand_penalty = 100 //try using a bow with one hand, buddy
	accuracy = 2
	var/has_arrow = 0
	wielded_item_state = "compositebow-wielded"
	bulletinsert_sound = '' //find audio
	fire_sound = '' //find audio
	gun_type = GUN_BOW
	far_fire_sound = "" //find audio

/obj/item/gun/projectile/bow/update_icon()
	..()
	if(chambered)
		icon_state = "compositebow-loaded"
	else
		icon_state = "compositebow"

/obj/item/gun/projectile/bow/examine(mob/user, distance)
	. = ..()
	if(loaded.len)
		to_chat(user, "This bow is <span class='bnotice'>NOCKED.</span>")
	else
		to_chat(user, "<span class='danger'>This bow is <b>EMPTY</b>.")


/obj/item/gun/projectile/bow/load_ammo(var/obj/item/A, mob/user) //sorry but this isnt a gun so i gotta override those to_chats! mdr!
	if(istype(A, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/C = A
		if(!(load_method & SINGLE_CASING) || caliber != C.caliber)
			return //incompatible
		if(loaded.len >= max_shells)
			to_chat(user, "<span class='warning'>[src] is nocked!</span>")
			return

		user.remove_from_mob(C)
		C.loc = src
		loaded.Insert(1, C) //add to the head of the list
		user.visible_message("[user] nocks \a [C] into [src].", "<span class='notice'>You nock \a [C] into [src].</span>")
		if(bulletinsert_sound)
			playsound(src.loc, bulletinsert_sound, 75, 1)

	update_icon()
