From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Problems with DNAT'ing in PREROUTING
Date: Tue, 28 Apr 2009 19:20:40 +0300
Message-ID: <1240935640.8365.4.camel@casper.meteor.dp.ua>
References: <3a8740fd0904280800t357f2531gfd5bfa9d37649587@mail.gmail.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3a8740fd0904280800t357f2531gfd5bfa9d37649587@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Cc: netfilter@vger.kernel.org

=F7 =F7=D4=CF, 28/04/2009 =D7 20:30 +0530, Subhadeep Ghosh =D0=C9=DB=C5=
=D4:
> Hello,
>=20
> I am trying to build a custom firewall kernel module for Linux. The
> module registers itself in the pre-routing chain as the first module.
> In the NetFilter callback function I check if the skb is for a tcp
> connection and the port is 80. If the two requirements are meant, I
> modify the destination address and the checksum of the IP as well as
> the TCP header to the ip address of the machine where this (DNAT) is
> taking place in the ip header and let the packet pass. Unfortunately,
> this is not working. I've put a great deal of effort trying to
> understand the DNAT'ing code in xtables but again of no use. As far a=
s
> I've read, at the time of pre-routing nothing in the skb, excepting
> the ethernet, ip and protocol headers along with the payload is set.
> If that is the case (and if the checksums are all right), I don't see
> a reason why a packet should be dropped.
>=20
> Following is the NetFilter callback function code (I am not including
> the rest of the code as it is trivial).
>=20
> static unsigned int _rfw_prerouting_hook(unsigned int             _nH=
ook,
>                      struct sk_buff*          _pSKB,
>                      const struct net_device* _pInNIC,
>                      const struct net_device* _pOutNIC,
>                      int (*_pOkFn)(struct sk_buff*))
> {
>   if(!strcmp(_pInNIC->name, "eth1"))
>     {
>       if(_pSKB)
>     {
>       struct iphdr* _pIPHeader =3D ip_hdr(_pSKB);
>=20
>       if(_pIPHeader)
>         {
>           switch(_pIPHeader->protocol)
>         {
>         case IPPROTO_TCP:
>           {
>             struct tcphdr* _pTCPHeader =3D (struct tcphdr*)(_pSKB->da=
ta
> + (_pIPHeader->ihl << 2));
>=20
>=20
>             if(_pTCPHeader &&
>                (_pIPHeader->daddr !=3D ((1 << 24) + 10)) &&
>                (_pTCPHeader->dest =3D=3D htons(80)))
>               {
>             // Only modifying TCP packets whose destination IP is not
> 10.0.0.1 and destination port is 80
>             _pIPHeader->daddr =3D (1 << 24) + 10; // Hopefully this
> translates to 10.0.0.1
>             _pIPHeader->check =3D 0;
>             _pIPHeader->check =3D ip_fast_csum((unsigned
> char*)_pIPHeader, _pIPHeader->ihl);
>=20
>             _pTCPHeader->check =3D 0;
>             _pTCPHeader->check =3D tcp_v4_check(_pTCPHeader->doff << =
2,
> _pIPHeader->saddr,
>                               _pIPHeader->daddr,
>                               csum_partial((char*)_
> pTCPHeader,
>                                        _pTCPHeader->doff << 2,
>                                        0));
>               }
>           } break;
>         }
>         }
>     }
>     }
>=20
>   return NF_ACCEPT;
> }
>=20
> One might say that this task can be easily done using a trivial
> iptables rule, but my problem does not end at this point. What I am
> expected to do is eventually conditionally do a DNAT for just a
> specified, dynamic set of IP addresses.

If the task needed is usual DNAT and the problem is in the fact
that addresses are dynamic then "ipset" would solve your task.

It is much more simple and easy to add/remove IPs to/from ipset
in combination with static DNAT rules even from withing C program.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

