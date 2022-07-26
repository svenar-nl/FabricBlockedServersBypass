package nl.svenar.noblocklist;

import net.fabricmc.api.ModInitializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BlockedServersBypass implements ModInitializer {
	public static final Logger LOGGER = LoggerFactory.getLogger("bsb");

	@Override
	public void onInitialize() {
		LOGGER.info("Blocked servers bypass ready!");
		LOGGER.info("- Enjoy playing on all servers.");
	}
}
