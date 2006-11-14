From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: opening up an ipchain
Date: Tue, 14 Nov 2006 23:40:24 +0100
Message-ID: <5950b335a1ae99d1fb0593c324f4b67b@former03.de>
References: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alex Feldman <alex@alexandrite.boisestate.edu>
Cc: netfilter@lists.netfilter.org

Hi Alex,

> However, I would like to open up the computer further, maybe not all=20=

> the
> way but for the moment that would be OK, to my own laptop via its mac
> address - I figure that would be pretty safe, but if not, I'd like to
> hear why not.  So I added the line:
>
> iptables -A INPUT -m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT

That should be the rule you want to add. You don't need a -p all (which
esentially means the same as leving it out - "-p all" - match all
protocols or without that: ignore the protocol).

I suspect you either have some more rules added somewhere (check that
using "iptables -L -v", look for REJECT and DROP targets), a typo in
the mac (you may try whether "arp" shows you an address for your other
computer) or an error unrelated to packet filtering.

For debugging, try the following:
1) Add logging (-A INPUT -j LOG --log-prefix SOME_PREFIX___), look for
    the output in the syslog kernel log (the location depends on your
    distribution - I don't know FC - I've seen these outputs at
    /var/log/kern* mostly)
2) try whether the connection works if you switch off packet filtering
    for a short while (iptables -F; iptables -X; iptables -t nat -F;
    iptables -t nat -X)

Baltasar

Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


