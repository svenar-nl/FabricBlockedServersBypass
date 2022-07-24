package nl.svenar.noblocklist.mixin;

import com.mojang.patchy.MojangBlockListSupplier;

import java.util.function.Predicate;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Overwrite;

@Mixin(MojangBlockListSupplier.class)
abstract class OverwriteBlocklist {

	/**
	 * Prevent the blocklist from being created by returning nothing.
	 * 
	 * @author Svenar
	 * @reason Do not restrict player where they want to play
	 * @return null
	 */
	@Overwrite(remap = false)
	public Predicate<String> createBlockList() {
		return null;
	}
}