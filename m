From: Ritesh Majumdar <r.majumdar@globallogic.com>
Subject: Re: iptables ERROR
Date: Thu, 25 Jun 2009 19:30:52 +0530
Message-ID: <1245938452.4518.63.camel@ripper.synapse.com>
References: <1245934611.4518.58.camel@ripper.synapse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1245934611.4518.58.camel@ripper.synapse.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org

Hello,

As per my earlier mail.

Here is error I get on my /var/log/messages.

kernel: ip_tables: set match: invalid size 96 !=3D 32



Thanks,




On Thu, 2009-06-25 at 18:26 +0530, Ritesh Majumdar wrote:
> Hello List,
>=20
> I have recently added ipset code in to my kernel, so all the ipset
> ralated ko's can be compiled while I compile kernel.
> my compilation works fine and I can add ipset rules successfully.
> but when I add iptables rules to macth specific set I get error.
>=20
> Here is what I am trying to do.
>=20
> =EF=BB=BF
>=20
> ipset -N a_ipset iphash=20
> iptables -N a=20
> iptables -N b=20
> iptables -A a -p udp -m set --set a_ipset dst -j b=20
>=20
>=20
>=20
>=20
>=20
> when I try to add the last rule,(=EF=BB=BFiptables -A a -p udp -m set=
 --set
> a_ipset dst -j b)  it fails with the error as below.
>=20
> iptables: Invalid argument
>=20
>=20
>=20
> I am not sure if its ipset issue or iptables.
>=20
> I am using "kernel 2.6.27" "ipset-2.4.9" and "iptables-1.4.1.91"
>=20
>=20
> Many Thanks.
> Ritesh.
>=20
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
