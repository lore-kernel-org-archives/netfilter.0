From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: Resend TCP segment modified to the sender
Date: Wed, 2 Jun 2004 19:05:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ed01c448cc$3ba90f40$68892090@grouse>
References: <OFDC07E26C.59270C87-ON65256EA7.0052FA9B@hss.hns.com>
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
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org

Hi Amit,

>
> Hi Jee
>
> 1. Yes, I return NF_STOLEN cos I dont wat it to go the interface and call
> netif_rx cos I want it to appear as it were coming from the interface.
this
> I do to prevent a loop in my dirver, if I do netif_rx(skb) , the
> skb->nfmark field wont be overwritten, otherwise if I allow it to go the
> interface by NOT returning NF_STOLEN, a new skb would be allocated for it
> and hence ill lose my nfmark field.
> 2. Yes the RST is supposed to go the local machine itself.
> 3. So u mean I cannot change m->mark field, such that when the packet gets
> reinjected into the kernel the mark field is what I updated it to ?

I didn't try it. I guess you cannot. I think m->any is just for our
information and actually these parameters are assigned and maintained by the
kernel. I even think ipq_set_verdict never passes any of these m->parameters
other than m->packet_id to the kernel. And m->packet_id is just used for
mapping a certain packet block in the kernel, no modifications are allowed.
I tried to modify m->packet_id and the kernel just got confused what that
packet was and error occured --- but this is obvious and not a convincing
evidence. Please anybody correct me if I am wrong.

Jee

> regards
> Amit
>
>
>
>
> "Jee J.Z." <jz105@york.ac.uk> on 06/02/2004 03:58:38 PM
>
> To:    Amit Kumar Singh/HSS@HSS
> cc:    <netfilter@lists.netfilter.org>
>
> Subject:    Re: Resend TCP segment modified to the sender
>
>
> Hi Amit,
>
> A few questions inline...
>
> > hi,
> >
> >    I am trying to do something similar, if anyone wants i can send the
> code
> > snippets. I start a telnet session between two hosts and then capture a
> > packet in between, and try to send back an RST segment, I do checksum
> > calculation and all my self. (both ip and tcp)
> > 1. NF_IP_LOCAL_OUT queues the packet to user space
> > 2. user space reads it using ipq_read, modifies packet, then sets a
> verdict
> > of NF_ACCEPT
> > 3. This packet is now caught at NF_IP_POST_ROUTING, I call netif_rx for
> > that skb from here and return NF_STOLEN from hook call back function of
> > NF_IP_POST_ROUTING.
>
> Hm, I don't know much about the kernel routine, but just wonder whether
> calling netif_rx means you grab the packet directly from POST ROUTING to
> the
> first step of receiving a packet from the interface? And NF_STOLEN means
> you
> never want the packet going to the interface?
>
> > 4. what happens after that is not clear to me, surely the RST i sent
> doesnt
> > reach the tcp connection it was intended for and hence the packet is
> > dropped  somewhere by the kernel. when and where is a problem for me,
any
> > idea how do I fgiure that out.
>
> So your RST is supposed to go to the local machine itself?
>
> > Also Sven, The problem I talked about yesterday, POST_ROUTING not
getting
> > the packet after LOCAL_OUT queued it to the user space. I overcame that
> > problem, but only after I started setting the mark to a particular value
> in
> > the NF_IP_LOCAL_OUT hooks function itself, before queuing it to the user
> > space. Earlier I was setting ipq_packet_msg->mark = THAT VALUE inside
the
> > user level program.
>
> Then it should be my problem of using libnet...
>
> > Hence, these are my doubts :
> >
> >    ipq_packet_msg-> mark i.e all the fields in ipq_packet msg can we
> modiy
> >    them in user space, and inject the "modified" packet back into the
> >    kernel ? I dont think this is possible with ipq_packet_msg->mark
> field,
> >    that is just for reading.
>
> Agree.
>
> >    Also, if i want to modify the packet before
> >    setting a verdict of NF_ACCEPT, how do I do it, the ip header starts
> >    from (unsigned char *)(packet+1), am I right ?
>
> if
> ipq_packet_msg *m = ipq_get_packet(buf)
> packet = (unsigned char *)m + sizeof(*m)
> then
> ip header starts at *packet, not *(packet+1).
>
> >    Once i modify contents
> >    here, say interchange the src , dest ip, and then set verdict to
> >    NF_ACCEPT, the packet that is actually injected has the changed
> values.
>
> Yes, just figure out the modified packet length and
ipq_set_verdict(handle,
> m->packet_id, packet_len, modified_packet).
>
> Jee
>
> > regards
> > Amit
> >
> >
> >
> >
> > "Kotatsu" <naughtydog@virgilio.it>@lists.netfilter.org on 06/02/2004
> > 12:09:44 AM
> >
> > Sent by:    netfilter-admin@lists.netfilter.org
> >
> >
> > To:    <netfilter@lists.netfilter.org>
> > cc:
> >
> > Subject:    Resend TCP segment modified to the sender
> >
> >
> >
> > Hi guys,
> > I have a problem. I have a  client (192.168.9.2) that send TCP segment
> > to a server (192.168.11.2).  Between this PC there is a Linux router
that
> > captures all the segment  and do forwarding. I want that it takes a
> client
> > packet (the 10th TCP data  packet sended, for example), modify it as i
> > want, and then resend it to the  client with ipq_set_verdict.
> > Is this operation possible? Or netfilter  can only send the modified
> packet
> > at the server? If it's possible, which  field must i modify to do this
> > (i've tried to modify some flag but it doesn't  work)?
> >
> > Thanks for your help
> > Best regards
> >
> >
> >
> >
> >
> >
>
>
>
>
>


