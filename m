From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: bidirectional forwarding
Date: Thu, 29 Jul 2004 07:04:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4108855B.D7624DB2@knoware.nl>
References: <D5C9032B2B09C64EA2409D6214E91AC90511FF@asimail2.alphanumeric.com>
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
To: netfilter@lists.netfilter.org

Jason Opperisano schreef:

> > PC1               R1           R2           R3           R4            PC2
> > |---------------|   |-------|    |--------|   |--------|   |-----------|
> > 192.168.10.2   .1  12.1    12.2 13.1     13.2 16.1    16.2 11.1       11.2
> > e0             e0   e1     e0   e1        e0  e1       e0  e1          e0
>
> assuming:
>
>   default gw of pc1 is 10.1
>   default gw of r1 is 12.2
>
>   default gw of pc2 is 11.1
>   default gw of r4 is 16.1
>
> both r2 & r3 will need static routes telling them how to get to networks 10 and 11:
>
> on r2:
>
>   192.168.10.0/24 via 192.168.12.1
>   192.168.11.0/24 via 192.168.13.2

How cat r2 reach your 16-network? you will need to add a routing for
that network to.

>
>
> on r3:
>
>   192.168.10.0/24 via 192.168.13.1
>   192.168.11.0/24 via 192.168.16.2

Same for r3, but now for your 12-network.

>
>
> the output of:
>
>   ip route get 192.168.10.2
>   ip route get 192.168.11.2
>
> on r2 and r3 should clue you in to where the packets are going.
>
> HTH...
>
> -j

Routingprotocols are designed for this kind of problem, to get this
resolved
automaticly. In this case you might look at zebra.

Regards,
--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B
GPG PblKey fprnt=ED20 0F25 C233 DC59 3FFA  170E D0BF 15F5 0BA6 1355


