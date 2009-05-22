From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Fri, 22 May 2009 07:32:52 +0300
Message-ID: <38db14850905212132x3d4f4d83y6808ad89d2d79324@mail.gmail.com>
References: <4A0DE859.7000209@tigertech.com>
	 <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>
	 <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com>
	 <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
	 <4A1466F6.8070304@tigertech.com>
	 <alpine.DEB.2.00.0905202327240.11796@blackhole.kfki.hu>
	 <alpine.DEB.2.00.0905211729090.13699@blackhole.kfki.hu>
	 <4A15A156.6030400@tigertech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=XO4YlRr6LI4Lwvr6toBYiPUFgHChq83WBjYgmrhCIys=;
        b=EuqwNqq4xlY0Qydzn/JHuYkgpbyPA7Pb9aZvaANy+jIGvqa7K3bcpDrAHN27xWwJWq
         umaZJdlJjWAGl1iBVU8LwwNRrs5s6/KHyrnsZWFxxVdepHxUZ++VNhJfzSfm3YQTbtVl
         DA9dFylXLV6Ge5W6PaEXqX/hVc9wNrjNsrV30=
In-Reply-To: <4A15A156.6030400@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert L Mathews <lists@tigertech.com>
Cc: netfilter@vger.kernel.org

2009/5/21 Robert L Mathews <lists@tigertech.com>:
>
> Perhaps I'm misunderstanding, but I don't think this will fix it.
>
> Although the original example I gave involved TCP retransmits that
> "reanimated" the connection, the problem is unfortunately not limited=
 to
> that case, and there don't need to be any TCP retransmits involved. (=
The
> subject of this thread is now a little misleading and overly-specific=
,
> unfortunately.)
>
> Here's the opening of a telnet connection that I injected a bogus RST=
 packet
> into (the packet has sequence 522209353 instead of the correct 522209=
354):
>
> client.52665 > server.23: S 522209223:522209223(0) win 5840 <mss
> 1460,sackOK,nop,wscale 7>
> server.23 > client.52665: S 3233007698:3233007698(0) ack 522209224 wi=
n 5792
> <mss 1460,sackOK,nop,wscale 6>
> client.52665 > server.23: . ack 3233007699 win 46 <nop,nop>
> server.23 > client.52665: P 3233007699:3233007711(12) ack 522209224 w=
in 91
> <nop,nop>
> client.52665 > server.23: . ack 3233007711 win 46 <nop,nop>
> client.52665 > server.23: P 522209224:522209236(12) ack 3233007711 wi=
n 46
> <nop,nop>
> server.23 > client.52665: . ack 522209236 win 91 <nop,nop>
> server.23 > client.52665: P 3233007711:3233007735(24) ack 522209236 w=
in 91
> <nop,nop>
> client.52665 > server.23: . ack 3233007735 win 46 <nop,nop>
> client.52665 > server.23: P 522209236:522209327(91) ack 3233007735 wi=
n 46
> <nop,nop>
> server.23 > client.52665: P 3233007735:3233007750(15) ack 522209327 w=
in 91
> <nop,nop>
> client.52665 > server.23: P 522209327:522209351(24) ack 3233007750 wi=
n 46
> <nop,nop>
> server.23 > client.52665: P 3233007750:3233007753(3) ack 522209351 wi=
n 91
> <nop,nop>
> client.52665 > server.23: P 522209351:522209354(3) ack 3233007753 win=
 46
> <nop,nop>
> server.23 > client.52665: P 3233007753:3233007947(194) ack 522209354 =
win 91
> <nop,nop>
> client.52665 > server.23: R 522209353:522209353(0) win 65535
> client.52665 > server.23: . ack 3233007947 win 54 <nop,nop>
>
> At this point, the telnet connection with the server is fully establi=
shed
> and waiting for me to type something (because the server ignored the =
bogus
> RST). But conntrack incorrectly considers it CLOSEd (because conntrac=
k
> didn't ignore the RST). No retransmits were involved, though.
>
> Even if nf_conntrack_tcp_loose is true, and conntrack treats subseque=
nt
> packets as a new connection when I type something in telnet, I can ma=
ke it
> forget about the connection again by sending another bogus RST. If I =
send a
> bogus RST after every legitimate packet, conntrack will almost always=
 think
> the open connection is actually closed.
>
> Since no retransmits are necessary, I don't think a solution that loo=
ks for
> retransmits will help, unfortunately.
>
> --
> Robert L Mathews, Tiger Technologies =A0 =A0http://www.tigertech.net/
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

The problem consists in that RST-packet with wrong sequence number
must be treated as INVALID.
IMHO, the conntrack code should be changed in this way.

I wrote a fix( sorry, I don't experienced in kernel tcp stack  -
correct me if I somewhere wrong).

*** nf_conntrack_proto_tcp.c    2009-05-22 07:22:43.000000000 +0300
--- /usr/src/linux/1/nf_conntrack_proto_tcp.c   2008-09-08
13:20:51.000000000 +0300
*************** static int tcp_packet(struct nf_conn *ct
*** 969,979 ****
                   problem case, so we can delete the conntrack
                   immediately.  --RR */
                if (th->rst) {
!                 if (ntohl(th->seq) < ct->proto.tcp.last_seq) {
!                   ct->proto.tcp.state =3D old_state;
!                   return -NF_DROP;
!                 }
!                       else if (del_timer(&ct->timeout))
                                ct->timeout.function((unsigned long)ct)=
;
                        return NF_ACCEPT;
                }
--- 969,975 ----
                   problem case, so we can delete the conntrack
                   immediately.  --RR */
                if (th->rst) {
!                       if (del_timer(&ct->timeout))
                                ct->timeout.function((unsigned long)ct)=
;
                        return NF_ACCEPT;
                }

--=20
Best regards
Anatoly Muliarski
