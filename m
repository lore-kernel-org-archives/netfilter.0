From: Graham Swallow <Information-Cascade@ntlworld.com>
Subject: Re: INCOMPLETE [ 8bytes] with two src addresses! Faked Packet?
Date: Fri, 27 Feb 2004 19:05:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040227190555.214cbc6e.Information-Cascade@ntlworld.com>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com>
	<1077905740.2526.41.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077905740.2526.41.camel@anduril.intranet.cartel-securite.net>
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

Hello Cedric, salut, thanks for your reply, digestified list too,

> > [SRC=80.5.144.39 DST=200.179.192.14 LEN=40 TOS=0x00 PREC=0x00 TTL=1
> > ID=12701 PROTO=TCP INCOMPLETE [8 bytes] ]
> 
> This is original packet citation so your kernel can associate the error
> to the right sent IP packet.

	thanks, its ICMP repeat quoting, that explains the second SRC,

> > DST=80.5.144.39
> Destination : probably you  :)

	yes, but probably not! ... I didnt do a traceroute (until after!)

	I am a workstation, on NTL cable modem, with mediocre security,
	and reasonable iptables. I drop most un-established incoming
	things (a reply is too easy), allow all out (for now), and
	limit messages (so possibly miss some details). I have a test
	192.168. NAT laptop, but I didnt initiate this message. Hacked?

	If someone else injected the original packet, or the reply, why?
		Maybe it goes through their router? (unlikely)
		Maybe they want to create junk noise (wastes our time)
		Maybe they are debugging their code (whatever)
		Maybe I have an alien/virus (how would I know)

	Anyhow, I just wanted to let you know,
	in-case such things interest you ;-)
	I dont think there's much I can do,
	other than tighten up out-bound.

> > TTL=247
> Type 11, code 0 is TTL exceeded in transit.
> 	http://logi.cc/linux/NetfilterLogAnalyzer.php3


   regards
--
   Graham


