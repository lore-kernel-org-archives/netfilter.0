From: aksingh@hss.hns.com
Subject: Re: Resend TCP segment modified to the sender
Date: Wed, 2 Jun 2004 10:31:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF006EBA7E.83DBD3D8-ON65256EA7.00182C58@hss.hns.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Kotatsu <naughtydog@virgilio.it>
Cc: netfilter@lists.netfilter.org, Sven Schuster <schuster.sven@gmx.de>, "Jee J.Z." <jz105@york.ac.uk>





hi,

   I am trying to do something similar, if anyone wants i can send the =
code
snippets. I start a telnet session between two hosts and then capture a=

packet in between, and try to send back an RST segment, I do checksum
calculation and all my self. (both ip and tcp)
1. NF_IP_LOCAL_OUT queues the packet to user space
2. user space reads it using ipq_read, modifies packet, then sets a ver=
dict
of NF_ACCEPT
3. This packet is now caught at NF_IP_POST_ROUTING, I call netif_rx for=

that skb from here and return NF_STOLEN from hook call back function of=

NF_IP_POST_ROUTING.
4. what happens after that is not clear to me, surely the RST i sent do=
esnt
reach the tcp connection it was intended for and hence the packet is
dropped  somewhere by the kernel. when and where is a problem for me, a=
ny
idea how do I fgiure that out.

Also Sven, The problem I talked about yesterday, POST_ROUTING not getti=
ng
the packet after LOCAL_OUT queued it to the user space. I overcame that=

problem, but only after I started setting the mark to a particular valu=
e in
the NF_IP_LOCAL_OUT hooks function itself, before queuing it to the use=
r
space. Earlier I was setting ipq_packet_msg->mark =3D THAT VALUE inside=
 the
user level program.

Hence, these are my doubts :

   ipq_packet_msg-> mark i.e all the fields in ipq_packet msg can we mo=
diy
   them in user space, and inject the "modified" packet back into the
   kernel ? I dont think this is possible with ipq_packet_msg->mark fie=
ld,
   that is just for reading. Also, if i want to modify the packet befor=
e
   setting a verdict of NF_ACCEPT, how do I do it, the ip header starts=

   from (unsigned char *)(packet+1), am I right ? Once i modify content=
s
   here, say interchange the src , dest ip, and then set verdict to
   NF_ACCEPT, the packet that is actually injected has the changed valu=
es.

regards
Amit




"Kotatsu" <naughtydog@virgilio.it>@lists.netfilter.org on 06/02/2004
12:09:44 AM

Sent by:    netfilter-admin@lists.netfilter.org


To:    <netfilter@lists.netfilter.org>
cc:

Subject:    Resend TCP segment modified to the sender



Hi guys,
=A0=A0=A0 I have a problem. I have a  client=A0(192.168.9.2) that send =
TCP segment
to a server (192.168.11.2).  Between this PC=A0there is=A0a Linux route=
r that
captures all the segment  and do forwarding. I want that it takes a cli=
ent
packet (the 10th TCP data  packet sended, for example), modify it as i
want, and then resend it to the  client with ipq_set_verdict.
Is this operation possible? Or netfilter  can=A0only send the modified =
packet
at the server? If it's possible, which  field must i modify to do this
(i've tried to modify some flag but it doesn't  work)?

Thanks for your help
Best regards


=



