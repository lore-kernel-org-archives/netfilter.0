From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Fri, 22 May 2009 11:26:12 +0300
Message-ID: <38db14850905220126t55f0e754y6c65cbfaed533bc0@mail.gmail.com>
References: <4A0DE859.7000209@tigertech.com> <4A0F7FEE.3010405@tigertech.com>
	 <4A139222.2020505@tigertech.com>
	 <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
	 <4A1466F6.8070304@tigertech.com>
	 <alpine.DEB.2.00.0905202327240.11796@blackhole.kfki.hu>
	 <alpine.DEB.2.00.0905211729090.13699@blackhole.kfki.hu>
	 <4A15A156.6030400@tigertech.com>
	 <38db14850905212132x3d4f4d83y6808ad89d2d79324@mail.gmail.com>
	 <alpine.DEB.2.00.0905220917190.14889@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=RhszGrLa6HzlkpUiksZPL7Bq7DOw/rLLT+WeR1wL2c4=;
        b=UR4kLCWnGyCC+0/9+NFPNEwZ05+jtQkFMaUeunJngR8DlFMEGOh1xSBtUrFTE0Pb8+
         waZH2C37B5hHUZDXq4gteEGAaecvM2jG/BZNIijx/Hl9T658ZbrO/wXmxz4xflfnhPy5
         sR4509qW+v33dPIAoCAqkgrUb3J+q2mvy4tko=
In-Reply-To: <alpine.DEB.2.00.0905220917190.14889@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

2009/5/22, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
> On Fri, 22 May 2009, Anatoly Muliarski wrote:
>
> > The problem consists in that RST-packet with wrong sequence number
> > must be treated as INVALID.
> > IMHO, the conntrack code should be changed in this way.
> >
> > I wrote a fix( sorry, I don't experienced in kernel tcp stack  -
> > correct me if I somewhere wrong).
> >
> > *** nf_conntrack_proto_tcp.c    2009-05-22 07:22:43.000000000 +0300
> > --- /usr/src/linux/1/nf_conntrack_proto_tcp.c   2008-09-08
> > 13:20:51.000000000 +0300
> > *************** static int tcp_packet(struct nf_conn *ct
> > *** 969,979 ****
> >                    problem case, so we can delete the conntrack
> >                    immediately.  --RR */
> >                 if (th->rst) {
> > !                 if (ntohl(th->seq) < ct->proto.tcp.last_seq) {
> > !                   ct->proto.tcp.state = old_state;
> > !                   return -NF_DROP;
> > !                 }
> > !                       else if (del_timer(&ct->timeout))
> >                                 ct->timeout.function((unsigned long)ct);
> >                         return NF_ACCEPT;
> >                 }
> > --- 969,975 ----
> >                    problem case, so we can delete the conntrack
> >                    immediately.  --RR */
> >                 if (th->rst) {
> > !                       if (del_timer(&ct->timeout))
> >                                 ct->timeout.function((unsigned long)ct);
> >                         return NF_ACCEPT;
> >                 }
>
> That won't work: the packet which sequence number was recorded in last_seq
> may get lost in transit to the destination and we may receive a *valid*
> RST with a sequence number less than the one in last_seq.
>
> This is the main problem: we can never be sure the packets which are seen
> by firewall do really reach the destination or they order is preserved.
>
> Best regards,
> Jozsef

OK.
We could save the LAST sequence number as a current one.
So we keep the connection and mark the current RST as invalid and
correctly react on the following ones. Unfortunately this does not
solve the main problem - unable to know whether the received sequence
number is valid or not. As an vague idea - we could track the ack
number from other direction and so keep the last delivered sequence
number. What can say about it?

I added a line in my patch.


*** nf_conntrack_proto_tcp.c    2009-05-22 11:00:29.000000000 +0300
--- /usr/src/linux/1/nf_conntrack_proto_tcp.c   2008-09-08
13:20:51.000000000 +0300
*************** static int tcp_packet(struct nf_conn *ct
*** 969,980 ****
                   problem case, so we can delete the conntrack
                   immediately.  --RR */
                if (th->rst) {
!                 if (ntohl(th->seq) < ct->proto.tcp.last_seq) {
!                   ct->proto.tcp.state = old_state;
!                   ct->proto.tcp.last_seq = ntohl(th->seq);
!                   return -NF_DROP;
!                 }
!                       else if (del_timer(&ct->timeout))
                                ct->timeout.function((unsigned long)ct);
                        return NF_ACCEPT;
                }
--- 969,975 ----
                   problem case, so we can delete the conntrack
                   immediately.  --RR */
                if (th->rst) {
!                       if (del_timer(&ct->timeout))
                                ct->timeout.function((unsigned long)ct);
                        return NF_ACCEPT;
                }



-- 
Best regards
Anatoly Muliarski
