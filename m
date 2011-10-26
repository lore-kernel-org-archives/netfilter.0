From: =?UTF-8?B?TmljY29sw7IgQmVsbGk=?= <darkbasic@linuxsystems.it>
Subject: Re: Problem with ip spoofing load balancing
Date: Wed, 26 Oct 2011 22:38:55 +0200
Message-ID: <4EA86FDF.8090906@linuxsystems.it>
References: <4EA821DD.1050306@linuxsystems.it> <alpine.LFD.2.00.1110262235340.1558@ja.ssi.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxsystems.it;
	s=linuxsystems.it; t=1319661493;
	bh=E+elC9jwKjAvxgDU7riogZG1Ts2XMVYmy0oPzrvZIyI=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=mqlTjutoSqH59dDwIQZiTwDjEhdSkR8DaYlr7k/Pv+2Bm2yvBYdDVLXhib+MyPgdH
	 MEGsfK1k+DVv2+DhjKfWpAdZP2jxyFDE7Y2ethVQ3Gw9jvlov9J0XZEPrPeSTySjRG
	 L2rLXsg7tDBEO/IQmOx9YEKJ7TRs8WS5+CJ2Ys3I=
In-Reply-To: <alpine.LFD.2.00.1110262235340.1558@ja.ssi.bg>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@vger.kernel.org
Cc: wireshark-users@wireshark.org, lartc@lists.linuxsystems.it

Il 26/10/2011 21:43, Julian Anastasov ha scritto:
> 	I looked at broken-spoofing-server.pcap and
> broken-spoofing-client.pcap
>
> 	It looks like that this packet comes after some
> packet that is dropped before server:
>
> IP 2.119.245.36.80>  88.38.77.130.39243: Flags [P.], seq 1449:1534, a=
ck 602, win 438, options [nop,nop,TS val 17124611 ecr 56937089], length=
 85
>
> 	May be the seq 1:1449 packet can not reach 2.119.245.36.80,
> that is why it does not go to client 88.38.77.130.39243.
> May be server is a virtual server or something like that.
>
> 	I guess someone before 2.119.245.36.80 is sending
> large packets and some MTU is low and may be due to missing
> ICMP the sender there can not learn the lower path MTU.
> May be client can use ip route add ... advmss 1400 to check
> if problem is fixed that way. May be there is some tunnel
> behind the server that uses lower MTU.
>
> 	Note that some 3.0.X kernels have problem that
> ICMP is not sent and this can cause PMTU problems.

SOLVED! Thanks Julian Anastasov.

Niccol=C3=B2
