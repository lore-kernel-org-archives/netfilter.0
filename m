From: "Christoph Galuschka" <christoph.galuschka@tikom.at>
Subject: Re: Trying to set up NAT
Date: Fri, 01 Apr 2005 18:13:33 +0200
Message-ID: <424D8F4D.3445.1199BB81@localhost>
References: <424D8057.28845.115F4D28@localhost>
Reply-To: christoph.galuschka@tikom.at
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <424D6F69.8000803@mnemon.de>
Content-description: Mail message body
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

thanks J=F6rg for the help. It helped me solve the problem.

First I had to enable forwarding on the machine (echo 1 > 
/proc/sys/net/ipv4/ip_forward). Then I wrote four rules, one for 
postrouting and one for prerouting, and two for forwarding to 
and from the new destination.

And everything works :)

thanks any have a nice weekend.

Christoph


Am 1 Apr 2005 um 17:57, schrieb J=F6rg Harmuth:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>  
> Hi Christoph,
> 
> unfortunately you don't provide any information about your 
rule set.
> So this is only a wild guess.
> 
> I assume your ruleset looks something like this:
> 
> iptables -L -t nat:
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       tcp  --  anywhere             anywhere            tcp \
> dpt:15000 to:10.1.1.2:80
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> MASQUERADE  all  --  anywhere             anywhere
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> Also assuming, that a client - say 10.10.10.3 - tries to 
connect to
> 10.10.10.1:15000 you have a conntrack entry like this:
> 
> cat /proc/net/ip_conntrack | grep -i unreplied:
> tcp      6 80 SYN_SENT src=3D10.1.1.3 dst=3D10.1.1.1 
sport=3D1759 \
> dport=3D15000 [UNREPLIED] src=3D10.10.10.2 dst=3D10.10.10.3  
sport=3D80 \
> dport=3D1759 use=3D1
> 
> As you can see client 10.10.10.2 gets an answer package 
from
> 10.10.10.3 but expects the answer from 10.10.10.2. If this is 
your
> scenario you need SNAT too, eg:
> 
> iptables -t nat -A POSTROUTING -p tcp -d 10.10.10.2 --
dport 80 -j SNAT \
> - --to 10.10.10.1
> 
> Another possibility is that you didn't allow this traffic in your
> FORWARD chain and the policy is DROP (REJECT). 
Something like this
> makes it work:
> 
> iptables -A FORWARD -p tcp -d 10.10.10.2 --dport 80 -m 
state --state \
> NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> iptables -A FORWARD -p tcp -s 10.10.10.2 --sport 80 -m 
state --state \
> ESTABLISHED,RELATED -j ACCEPT
> 
> If you need further help, please post your rule-set.
> 
> HTH and have a nice time
> 
> J=F6rg
> 
> 
> Christoph Galuschka schrieb:
> 
> > Hello,
> >
> > I've tried the whole day setting up NAT and it won't work. I 
have
> > the follinwg situation: I have a proxy server (the machine 
running
> > NAT) and various other machines. I want the proxy server 
to NAT
> > some incoming connections to other machines. ie: A 
connection to
> > the proxy (10.1.1.1) on port 15000 should go to another 
machine
> > (10.1.1.2) on port 80 via the proxy. I have already 
managed a
> > locale NAT (meaning chaning ports ie from 15000 to 80 on 
the
> > proxy), but as soon as I try to DNAT to another machine it 
won't
> > work anymore.
> >
> > Any help would be apprechiated.
> >
> > thanks, happy weekend an regards Christoph
> >
> 
> 
> - --
> - ----------------------------------------------------------------------=
-
> mnemon
> J=F6rg Harmuth
> Marie-Curie.Str. 1
> 53359 Rheinbach
> 
> Tel.: (+49) 22 26  87 18 12
> Fax:  (+49) 22 26 87 18 19
> mail: harmuth@mnemon.de
> Web:  http://www.mnemon.de
> PGP-Key: 
http://www.mnemon.de/keys/harmuth_mnemon.asc
> PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 
E48E 267B 204F
> - ----------------------------------------------------------------------=
-
> Diese Mail wurde vor dem Versenden auf Viren und andere 
sch=E4dliche
> Software untersucht. Es wurde keine malizi=F6se Software 
gefunden.
> 
> This Mail was checked for virusses and other malicious 
software before
> sending. No malicious software was detected.
> - ----------------------------------------------------------------------=
-
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.5 (MingW32)
> Comment: Using GnuPG with Thunderbird - 
http://enigmail.mozdev.org
>  
> 
iD8DBQFCTW9ot9fkjiZ7IE8RAvtQAKDz5Fx6w8Kb4ZGxPriU7
RCRBPPA+wCg6Ptk
> a6MktEG9Y9O0ZVoE2QSbkuY=3D
> =3DeoTF
> -----END PGP SIGNATURE-----
> 
> 


