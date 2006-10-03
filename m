From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: Help with NAT and port translation
Date: Tue, 03 Oct 2006 09:53:57 +0800
Message-ID: <359840672.09392@mail.nankai.edu.cn>
References: <900f379d0609300020u25d1ef89k912fb031cd72897c@mail.gmail.com>
	<359601254.21358@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <4521C2B5.1050601@mail.nankai.edu.cn>
In-Reply-To: <359601254.21358@mail.nankai.edu.cn>
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
To: =?ISO-8859-1?Q?AkiL_Muss=E1?= <akilmussa@gmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
AkiL Muss=E1 :
> Hi all,
>
> I need some help setting up iptables with NAT and port translation.
>
>
> I need to redirect all traffic comming to 41.220.40.183:80 to
> 10.0.0.1:8080
>
> The netfilter HOWTO says that its possible using the following
> rule, but it isn't working for me: iptables -A PREROUTING -t nat -p
> tcp -i eth0 --dport 80 -j DNAT --to 10.0.0.1:8080
>
> When I setup NAT using the same port (port 80 to 80), it works
> perfectly. The problem is when redirecting from port 80 to 8080
>
> Note: - 10.0.0.1 is a virtual machine created using Xen VMM
>
>
> My actual configuration is: # iptables -L -t nat -nv Chain
> PREROUTING (policy ACCEPT 1659 packets, 143K bytes) pkts bytes
> target     prot opt in     out     source destination 0     0 DNAT
> tcp  --  eth0   *       0.0.0.0/0 0.0.0.0/0           tcp dpt:80
> to:10.0.0.1:8080
>
> Chain POSTROUTING (policy ACCEPT 28126 packets, 1747K bytes) pkts
> bytes target     prot opt in     out     source destination 17560
> 1110K MASQUERADE  all  --  *      eth0 0.0.0.0/0
> 0.0.0.0/0
>
> Chain OUTPUT (policy ACCEPT 45638 packets, 2854K bytes) pkts bytes
> target     prot opt in     out     source destination
>
> ##### ##### ##### ##### #####
>
> #  iptables -L -nv Chain INPUT (policy ACCEPT 3470K packets, 374M
> bytes) pkts bytes target     prot opt in     out     source
>  destination
>
> Chain FORWARD (policy ACCEPT 3212 packets, 1440K bytes) pkts bytes
> target     prot opt in     out     source destination 0     0
> ACCEPT     all  --  *      *       10.0.0.1 0.0.0.0/0
> PHYSDEV match --physdev-in vif5.0 0     0 ACCEPT     udp  --  *
> *       0.0.0.0/0 0.0.0.0/0           PHYSDEV match --physdev-in
> vif5.0 udp spt:68 dpt:67 0     0 ACCEPT     all  --  *      *
> 10.0.0.2 0.0.0.0/0           PHYSDEV match --physdev-in vif6.0 0
> 0 ACCEPT     udp  --  *      *        0.0.0.0/0 0.0.0.0/0
> PHYSDEV match --physdev-in vif6.0 udp spt:68 dpt:67
>
> Chain OUTPUT (policy ACCEPT 3465K packets, 353M bytes) pkts bytes
> target     prot opt in     out     source destination
>
>
> Thanks for any help...
I think there is nothing wrong in your iptables NAT rule .
The bug may be present in other parts of your box .
Do you use Xen in your box ?
Can you access the 10.0.0.1:8080 directly ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
=20
iD8DBQFFIcK17tZp58UCwyMRAqawAKChFxJ3qSrLoO3NdNkiUJ6n7+lCwACeOLNB
K5GACoB4jLReav6E5N/8y7Y=3D
=3DNmdP
-----END PGP SIGNATURE-----


