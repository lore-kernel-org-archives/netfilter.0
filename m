From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: Modify packets using netfilter
Date: Sat, 13 Dec 2003 23:11:04 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <025c01c3c1ce$61f202e0$68892090@grouse>
References: <007101c3c190$0b3d6450$cb0210ac@jz105> <200312131549.45158.Antony@Soft-Solutions.co.uk> <007d01c3c198$873df440$cb0210ac@jz105> <1071346885.1309.3.camel@porky>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Hi Eric and all,

Thank you again. I have a few further questions:
1. How many packets can ip_queue queue for userspace? How can we change t=
he
size of QUEUE?
2. Can we use ipq_read() and ipq_set_verdict() to access and process queu=
ed
packets in any order?
    More specifically, for example, I wish to ipq_read() a number of pack=
ets
from QUEUE before ipq_set_verdict() any of them, and then ipq_set_verdict=
()
in whichever order I want. It is possible?

Cheers,
Jee


----- Original Message -----=20
From: "Eric Leblond" <eric@regit.org>
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: <netfilter@lists.netfilter.org>
Sent: Saturday, December 13, 2003 8:21 PM
Subject: Re: Modify packets using netfilter

Le sam 13/12/2003 =C3=A0 17:45, Jee J.Z. a =C3=A9crit :
> Hi Antony and all,
>
> Thanks for your reply. What I am trying to do is to get the whole packe=
ts
including their payloads and store them into a self defined queue, and
randomly modify some bits in each packet.
> I am using iptables userspace programming. Does anybody have some good
idea how to achieve this? Thank you.

with libipq you can modify the payload of the packet :

Take from man page :
int ipq_set_verdict(const struct ipq_handle *h, ipq_id_t  id,  unsigned
       int verdict, size_t data_len, unsigned char *buf);

if data_len is not 0 and buf is not NULL, the header and payload of the
packet get replaced by the datas pointed by buf.

BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)


