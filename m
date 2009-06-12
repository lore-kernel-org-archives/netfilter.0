From: Jesse Molina <jesse@opendreams.net>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Fri, 12 Jun 2009 00:12:53 -0700
Message-ID: <4A31FFF5.1030703@opendreams.net>
References: <4A19235F.4070306@opendreams.net> <4A192D38.90008@redpill-linpro.com> <4A19B5F1.4080000@opendreams.net> <4A1A6178.8080907@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A1A6178.8080907@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>


Just wanted to reply again for documentation purposes regarding this ol=
d=20
thread.  This was EXACTLY what I was looking for.

Here are some sample commands to replicate this;

# Add the IP 1.2.3.4 to eth1
# sudo ip route add local 1.2.3.4 table local dev eth1
#
# Show the local table
# sudo ip route show table local
#
# Delete the IP 1.2.3.4 from eth1
# sudo ip route delete local 1.2.3.4 table local dev eth1



I have not observed any daemon or service using the IPs that I=20
configured with this method for ephemeral (outbound) services.  My=20
upstream packet accounting confirms this.

Yes, the system replies to ARP requests for these IPs.

Unfortunately, local daemons that glob onto all addresses are still=20
answering to services on these IPs if you don't filter or re-direct the=
=20
traffic via iptables DNAT/SNAT, but that's not a major issue since it=20
can be controlled as mentioned here.



I have been using this for a couple of weeks, works great.  I recommend=
=20
this procedure over using secondary IPs on regular interfaces.

I hope this is useful to someone in the future.



Pascal Hambourg wrote:
> Hello,
>=20
> Jesse Molina a =E9crit :
>>
>> To restate my question:  What alternative ways are there to make the=
=20
>> GNU/Linux system reply to ARP requests for an IP, without that IP=20
>> being an actual interface on the host, or that interface must not be=
=20
>> used by local services *in any way*, for the reasons of using it via=
=20
>> SNAT/DNAT?
>=20
> ip route add local <address>/<mask> table local dev <interface>
>=20
> This way <address>/<mask> will be considered local by the system whic=
h=20
> will reply to ARP requests for it, actually usable by any local proce=
ss,=20
> but won't appear assigned to <interface> so chances are that no local=
=20
> process will use it unless told explicitly.
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
# Jesse Molina
# Mail =3D jesse@opendreams.net
# Page =3D page-jesse@opendreams.net
# Cell =3D 1.602.323.7608
# Web  =3D http://www.opendreams.net/jesse/


