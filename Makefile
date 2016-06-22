#MODELS = thierry mathilde
# mathilde has her main size set in percents...
MODELS = thierry

SIZES = 10 11 12 13 14 15 17 18 19 20

VARIANTS = $(foreach model,$(MODELS),$(foreach size,$(SIZES),$(model)$(size).css))

all: $(VARIANTS)

check:
	@echo VARIANTS=$(VARIANTS)

define variant_model_size
$(1)$(2).css: $(1).css
	sed -e 's|.*MAIN SIZE.*|font-size:$(2)px;|' $(1).css > $(1)$(2).css
endef

define variant_model
$(foreach size,$(SIZES),$(eval $(call variant_model_size,$(1),$(size))))
endef

$(foreach model,$(MODELS),$(eval $(call variant_model,$(model))))
