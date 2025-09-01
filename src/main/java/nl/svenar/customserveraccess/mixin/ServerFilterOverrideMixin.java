package nl.svenar.customserveraccess.mixin;

import com.mojang.patchy.MojangBlockListSupplier;

import java.util.function.Predicate;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Overwrite;

@Mixin(MojangBlockListSupplier.class)
abstract class ServerFilterOverrideMixin {

	/**
	 * Returns null to prevent the default server blocklist predicate from being
	 * applied.
	 * 
	 * This is intended to support advanced client-side configurations or research
	 * use cases where filtering is either unnecessary or undesired.
	 * 
	 * Use responsibly.
	 * 
	 * @author svenar
	 * @reason Research purposes only
	 * @return null
	 */
	@Overwrite(remap = false)
	public Predicate<String> createBlockList() {
		return null;
	}
}