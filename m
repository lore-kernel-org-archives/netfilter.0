From: Karel Rericha <karel@maxtel.cz>
Subject: Re: Bridges
Date: Tue, 24 Aug 2010 10:57:48 +0200
Message-ID: <AANLkTinpmkT6EGHGmXUMiVytbKPusQUim91w-2_kB9B7@mail.gmail.com>
References: <4C6B10CA.4090604@abpni.co.uk>
	<4C6C55C8.5000905@riverviewtech.net>
	<4C6C5739.5040106@abpni.co.uk>
	<4C6C59E2.4080307@riverviewtech.net>
	<4C6C5B87.9070906@abpni.co.uk>
	<alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr>
	<4C6C63EF.7060305@abpni.co.uk>
	<4C6C6731.50401@plouf.fr.eu.org>
	<4C6C67A6.9010405@abpni.co.uk>
	<4C6C6AED.3090008@plouf.fr.eu.org>
	<4C6C70B6.7050200@abpni.co.uk>
	<4C6CDC91.6060804@plouf.fr.eu.org>
	<4C6D7C42.9060409@abpni.co.uk>
	<4C6D857B.1070906@plouf.fr.eu.org>
	<4C6D87E3.9080207@abpni.co.uk>
	<4C6D9E9F.3080507@plouf.fr.eu.org>
	<4C6DA0F1.80909@abpni.co.uk>
	<4C6DAA53.70702@plouf.fr.eu.org>
	<4C6DB5FD.8030607@abpni.co.uk>
	<4C6E42A6.9080308@plouf.fr.eu.org>
	<4C704924.3080909@abpni.co.uk>
	<alpine.LSU.2.01.1008220122410.30882@obet.zrqbmnf.qr>
	<alpine.LSU.2.01.1008221108160.26133@obet.zrqbmnf.qr>
	<4C70E9A2.3040907@abpni.co.uk>
	<4C719073.7090506@plouf.fr.eu.org>
	<4C7194D3.7070803@abpni.co.uk>
	<4C722FAF.5030203@plouf.fr.eu.org>
	<4C72D7AA.1090206@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C72D7AA.1090206@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

See this graph (created by Jan Engelhardt), it should explain what you
are asking for:

http://jengelh.medozas.de/images/nf-packet-flow.png

Karel

> Sorry, I'm not wording my questions very well. Let me start from the top.
> Thanks everyone for the fantastic help by the way :)
>
> Ok, so as I understand Linux, and please correct me if I'm wrong, when a
> packet comes into a physical interface on a Linux machine, regardless of the
> status of the net.ipv4.conf.<interface>.forwarding, Linux will always put
> the packet onto a "chain". This will either be the INPUT chain or the
> FORWARD chain. Is that correct?
>
> Next, if the packet it destined for an IP of one of the local interfaces, it
> puts it onto the INPUT chain, correct?
>
> However if the packet it destined for a non-local host, it puts it onto the
> FORWARD chain, correct?
>
> Then, when the packet is on the forward chain, it depends on if the incoming
> interface is connected to a bridge or not. If it is connected to a bridge,
> the packet will transverse the FORWARD chain and go out the interface which
> must be part of the same bridge, correct?
>
> If, however, the incoming interface is not connected to a bridge, Linux will
> fordward the packet out of another interface which is thinks is correct (as
> defined by the routing table), but it will only do this if
> net.ipv4.conf.<interface>.forwarding is set to 1, correct?
>
> Before I go on with my next set of question, I'd just like someone to
> correct the above if it is wrong
>
> Many Thanks
