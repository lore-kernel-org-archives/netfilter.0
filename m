From: Jimmy James <jamesstickland@sympatico.ca>
Subject: Not really an iptables question, but related.
Date: Fri, 13 Sep 2002 00:51:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D816EEA.73DA04BE@sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, jamesstickland@sympatico.ca

OK.

The following is a plea for help with remote serial console.  The reason
i ask here is because i know of no other nix help-related mailing list,
and since i dislike IRC, i will not ask there.

A serial connection is required between my router and workstation.  I do
not want a keyboard/monitor on my router (valuable desk space).
However, I do wish to obtain a console from the router for
maintenance/logging while using my workstation.  Yet, the mainstream way
of connecting to your router is via ssh.   At the same time, I do not
want ssh running on my router, or any service at that.  The solution to
my eyes was the implementing of a serial null modem.  I obtained the
db-9f to db-9f pinouts for serial modem, two female 2-row db-9's, some
ribbon, heatshrink, and then soldered the a serial null modem.

The pinouts were as follows

Each side is a DB9 female.

1+6 - 4
2 - 3
3- 2
4 - 1+6
5 - 5
7 - 8
8-7

Is this pinout config wrong?
http://www.indiacam.net/pinout/ is my reference.




On the workstation, i created a new serial device for communications
port 1 (ttyS0), using irq4 and mem 0x3F8.  I set minicom to use that at
9600 N8.

On the router, i did the same, only editing the
/etc/lilo.conf/inittab/gettydefs files to make use of a serial console
using cp1/ttyS0 irq4, 0x3F8 at 9600 N8.  I made the kernel on the router
comply with the requirements for serial console, but i removed anything
to do with a video card/vga text console.

Upon booting the router with the new changes, proceeding the message
"Booting the kernel," the console originating from the router itself
shuts off, but the kernel continues to load.

During the bootup of the router, i have the serial null modem plugged
between the workstation and router.
The workstaion has minicom loaded.  However, nothing happens; no kernel
messages show up in minicom loaded on the workstation.  Upon inspecting
my workstation's serial port, i noticed that of the two ports i have,
only one will work at a time.  I cannot use the mouse on port 2 while
null modem is in port 1, or the other way around.  On the router, I can
use a mouse on any6 serial port while a null modem   Therfore, it seems
as if the serial ports on the router are fine.

Im taking it that my minicom and router cannot communicate.  Could this
be from wrong pinouts for a serial null modem, lack of an initilaization
code, bad serial port on workstion or is the configuration between the
two machines not exact in regards to serial communications config.

Tonight i will try connecting a laptop to the router using telex for
dos.  Maybe the serial ports are fine on it.


What do you think?

-James Stickland,
Unixversity of Scarborough-Toronto













