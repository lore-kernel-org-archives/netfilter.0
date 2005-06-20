From: Charles Jones <linuxchuck@gmail.com>
Subject: [announce] Frankenwall released to the public
Date: Mon, 20 Jun 2005 16:46:05 -0500
Message-ID: <9630799505062014462e0f3fd7@mail.gmail.com>
Reply-To: Charles Jones <linuxchuck@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello list,

Long time lurker here, first time poster...

After much peer-pressure, I have just "GPL'd" and released a bash
script that generates what I hope to be highly secure iptables
rulesets for very "network conscious" system administrators called
"Frankenwall".

Frankenwall creates IPSEC-aware (using the mark target in the mangle
chain) SNAT/Masq/Routing-capable iptables rules.  It also supports the
creation of Screened Subnets, port-forwarding, 1:1 static NAT,
standard routing, Ingress/Egress filtering, and MAC Whitelisting.=20
There are probably other features, but I don't recall them off the top
of my head.  See the README, and the in-line documentation in the
script itself for more details.

Please be warned:
The focus of this script is security.  If you don't specifically
permit a certain type of traffic, it will most likely not be allowed
through.  This means that if you don't understand some of the
intricacies of how the protocols on your network work, or even what
protocols are used, this script is not for you.

With that being said, here is the link:

http://sourceforge.net/projects/frankenwall

I would greatly appreciate any and all constructive criticism (with
suggestions please) on this script.  Questions about it or it's
configuration are also welcome.

Thanks for your time,

Charles Jones

