From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] -i and -o options for iptables FORWARD chain
Date: Fri, 2 Jan 2004 14:30:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040102133002.GA6057@kaufbach.delug.de>
References: <009a01c3cff6$ee23bd90$a5bbd00c@issaquah>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <009a01c3cff6$ee23bd90$a5bbd00c@issaquah>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

am  Wed, dem 31.12.2003, um 15:36:34 -0800 mailte Gongya Yu folgendes:
> Hi, I just updated Linux kernel to 2.6.0 with iptables and ebtables enabl=
ed.

I'm using iptables on 2.4.x, possible there are differences with 2.6.x.

> =20
> But iptables ignores -i and -o options for FORWARD chain. Wheneneve I use
> something like -i eth0 or -o eth0, the rule is just ignored.

RTFM!

-i is only for INPUT, FORWARD and PREROUTING
-o is only for FORWARD, OUTPUT and POSTROUTING

You can use -s and -d (Source and Destination-IP).


Andreas
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

