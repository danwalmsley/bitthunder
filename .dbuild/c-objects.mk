#
# Here we define the RBUILD default implicit C object build rule.
#
# This overrides Make's default implicit rule for C objects.
#

#
#	Include all object dependencies.
#
-include $(OBJECTS:.o=.d)

NEW_OBJECTS = $(addprefix $(BUILD_DIR),$(OBJECTS))

#NEW_OBJECTS = $(subst $(BASE),$(BUILD_DIR),$(OBJECTS))

ifeq ($(V), 3)
qd=
else
qd=@
endif


#$(BUILD_DIR)%.o: $(BUILD_BASE)%.c
#ifeq ($(DBUILD_VERBOSE_CMD), 0)											# Pretty print on successful compile, but still display errors when they occur.
# 	$(Q)$(PRETTY) --dbuild "CC" $(MODULE_NAME) $(notdir $@)
#endif
# 	@mkdir -p $(dir $@)
# 	$(Q)$(CC) -MD -MP $(CFLAGS) $< -o $@
# 	$(POST_CC)


#$(BUILD_DIR)%.o: $(BASE)%.c
$(BUILD_DIR)%.o: $(BASE)%.c
#$(BUILD_DIR)lib/src/handles/bt_handles.o: $(BASE)lib/src/handles/bt_handles.c
ifeq ($(DBUILD_VERBOSE_CMD), 0)											# Pretty print on successful compile, but still display errors when they occur.
	$(Q)$(PRETTY) --dbuild "CC" $(MODULE_NAME) $(subst $(BUILD_DIR),"",$@)
endif
	@mkdir -p $(dir $@)
	$(Q)$(CC) -MD -MP $(CFLAGS) $< -o $@
	$(POST_CC)


#$(OBJECTS): $(dir $(BUILD_ROOT)$($@:$(BASE)=""))
#$(OBJECTS): $(dir $@)


#$(dir $(BUILD_ROOT)$($@:$(BASE)="")):
#	mkdir -p $@