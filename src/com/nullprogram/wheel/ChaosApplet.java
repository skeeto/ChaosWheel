package com.nullprogram.wheel;

import javax.swing.JApplet;

/**
 * Run the chaotic wheel as an applet.
 */
public class ChaosApplet extends JApplet {

    private static final long serialVersionUID = 9171766702570708253L;
    private ChaosWheel wheel;

    /** {@inheritDoc} */
    public final void init() {
        wheel = new ChaosWheel();
        add(wheel);
    }

    /** {@inheritDoc} */
    public final void start() {
        wheel.start();
    }

    /** {@inheritDoc} */
    public final void stop() {
        wheel.stop();
    }

    /** {@inheritDoc} */
    public final void destroy() {
        wheel.stop();
    }
}
