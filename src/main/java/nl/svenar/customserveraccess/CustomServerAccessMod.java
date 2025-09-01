package nl.svenar.customserveraccess;

import net.fabricmc.api.ModInitializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CustomServerAccessMod implements ModInitializer {
	public static final Logger LOGGER = LoggerFactory.getLogger("customserveraccess");

	@Override
	public void onInitialize() {
		LOGGER.info("Custom Server Access Mod initialized.");
		LOGGER.info("- Server filter override is active (client-side only).");
	}
}
