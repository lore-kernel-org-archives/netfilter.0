From: Andreas =?iso-8859-1?Q?Westend=F6rpf?= <a.westendoerpf@gmx.de>
Subject: security question
Date: Wed, 02 Jun 2004 14:58:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi *!

I have the following setup. Please tell me if I have some security
issues here.

A linux box with two ethernet interfaces to work as a masquerading
router. One of them (eth0) is connected to a dsl-modem, the other is a
wlan card (eth1). All client systems get this box a default gateway
via dhcp.

My goal is to drop everything coming from the wlan by default. I do
this with:

# iptables -t nat -P PREROUTING  DROP

I want the all www-requests of the client systems to be redirected to
the local Apache on the box. I do this with:

# iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth1 - REDIRECT

As I need DNS for these www-requests I have to let DNS be accepted:

# iptables -t nat -A PREROUTING -p udp --dport 53 -i eth1 -j ACCEPT

Then, in the POSTROUTING chain I need all the packets that made it
here to be masqueraded:

# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

If I want to allow a specific wlan client to get outside connections I
use:

# iptables -t nat -I PREROUTING -m mac --mac-source XX:XX:XX:XX:XX:XX
-i the1 -j ACCEPT

to let him through.

Beside of MAC-spoofing, is this setup safe? Can someone get though the
PREROUTING chain, without being "MAC-inserted".

What can I do to block incoming connection attempts? I only want to
allow ssh from outside (internet) to the box.

Any help would be appreciated!

THX,
Andreas Westend=F6rpf



