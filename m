From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: How to "catch" FORWARD packets in POSTROUTING chain?
Date: Sun, 15 Aug 2004 22:23:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051284@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

>      I have lan (10.0.0.0/8) and server (10.1.1.1 for lan, dynamic ip
>      from my ISP). I use MASQUERADE to allow lan computer connects to
>      internet. eth0 connects to lan, ppp0 for internet.
>
>      All traffic lan <--> internet passes through FORWARD chain. How
>      can I "catch" this traffic in POSTROUTING chain?

define "catch."  you could say that you are already "catching" the =
traffic with your MASQUERADE rule--as it would have to be in the =
POSTROUTING chain of the NAT table...  maybe you want to log the traffic =
before it gets MASQ'ed?  then:

	iptables -t nat -I POSTROUTING -o $EXT_IF -j LOG

Or are you trying to do something else?  Maybe the POSTROUTING chain of =
the MANGLE table?

	iptables -t mangle -I POSTROUTING -o $EXT_IF -j crunch_n_munch

-j

