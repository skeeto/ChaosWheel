/* Copyright (c) 2010 Christopher Wellons <mosquitopsu@gmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for
 * any purpose with or without fee is hereby granted, provided that
 * the above copyright notice and this permission notice appear in all
 * copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
 * WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
 * AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
 * OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
 * NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
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
