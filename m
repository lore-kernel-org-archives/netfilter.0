From: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Subject: Problems with DNAT'ing in PREROUTING
Date: Tue, 28 Apr 2009 20:30:14 +0530
Message-ID: <3a8740fd0904280800t357f2531gfd5bfa9d37649587@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

I am trying to build a custom firewall kernel module for Linux. The
module registers itself in the pre-routing chain as the first module.
In the NetFilter callback function I check if the skb is for a tcp
connection and the port is 80. If the two requirements are meant, I
modify the destination address and the checksum of the IP as well as
the TCP header to the ip address of the machine where this (DNAT) is
taking place in the ip header and let the packet pass. Unfortunately,
this is not working. I've put a great deal of effort trying to
understand the DNAT'ing code in xtables but again of no use. As far as
I've read, at the time of pre-routing nothing in the skb, excepting
the ethernet, ip and protocol headers along with the payload is set.
If that is the case (and if the checksums are all right), I don't see
a reason why a packet should be dropped.

=46ollowing is the NetFilter callback function code (I am not including
the rest of the code as it is trivial).

static unsigned int _rfw_prerouting_hook(unsigned int=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 _nHook,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0struct sk_buff*=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 _pSKB,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0const struct net_d=
evice* _pInNIC,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0const struct net_d=
evice* _pOutNIC,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0int (*_pOkFn)(stru=
ct sk_buff*))
{
=A0 if(!strcmp(_pInNIC->name, "eth1"))
=A0=A0=A0 {
=A0=A0=A0=A0=A0 if(_pSKB)
=A0=A0=A0 {
=A0=A0=A0 =A0 struct iphdr* _pIPHeader =3D ip_hdr(_pSKB);

=A0=A0=A0 =A0 if(_pIPHeader)
=A0=A0=A0 =A0=A0=A0 {
=A0=A0=A0 =A0=A0=A0=A0=A0 switch(_pIPHeader->protocol)
=A0=A0=A0 =A0=A0=A0 {
=A0=A0=A0 =A0=A0=A0 case IPPROTO_TCP:
=A0=A0=A0 =A0=A0=A0 =A0 {
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 struct tcphdr* _pTCPHeader =3D (struct tc=
phdr*)(_pSKB->data
+ (_pIPHeader->ihl << 2));


=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if(_pTCPHeader &&
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0 (_pIPHeader->daddr !=3D ((1 << 2=
4) + 10)) &&
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0 (_pTCPHeader->dest =3D=3D htons(=
80)))
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 {
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 // Only modifying TCP packets whose desti=
nation IP is not
10.0.0.1 and destination port is 80
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 _pIPHeader->daddr =3D (1 << 24) + 10; // =
Hopefully this
translates to 10.0.0.1
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 _pIPHeader->check =3D 0;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 _pIPHeader->check =3D ip_fast_csum((unsig=
ned
char*)_pIPHeader, _pIPHeader->ihl);

=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 _pTCPHeader->check =3D 0;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 _pTCPHeader->check =3D tcp_v4_check(_pTCP=
Header->doff << 2,
_pIPHeader->saddr,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=
 _pIPHeader->daddr,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=
 csum_partial((char*)_
pTCPHeader,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0=A0=A0=A0 _pTCPHeader->doff << 2,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0=A0=A0=A0 0));
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 }
=A0=A0=A0 =A0=A0=A0 =A0 } break;
=A0=A0=A0 =A0=A0=A0 }
=A0=A0=A0 =A0=A0=A0 }
=A0=A0=A0 }
=A0=A0=A0 }

=A0 return NF_ACCEPT;
}

One might say that this task can be easily done using a trivial
iptables rule, but my problem does not end at this point. What I am
expected to do is eventually conditionally do a DNAT for just a
specified, dynamic set of IP addresses.

It would be great if someone could point me in the right direction.

Thank you and regards,
Subhadeep Ghosh
