From: woksy@ether.net1.nerim.net
Subject: iptables and ads
Date: Mon, 11 Aug 2003 17:38:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308111738.35713.woksy@ether.net1.nerim.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi people ! ;-)
I was just answering myself if i could stop ads loading from web pages su=
ch as=20
yahoo, lycos, & co ? (i don't mean blocking popup, just stopping those bo=
ring=20
ads from loading)
I tried to do this with something like that:
$IPTABLES -A INPUT -i $EXTIF -s 216.73.92.112/32 -j drop-and-log-it
but it seems that I mistaked.
Can anybody help me please ?=20
Thanks

