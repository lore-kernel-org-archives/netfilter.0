From: "=?iso-8859-1?Q?Geffrey_Vel=E1squez?=" <g_netfilter@netfids.com>
Subject: Re: IP Alias and NAT problems
Date: Tue, 9 Dec 2003 01:17:35 -0500 (PET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <49640.200.48.142.50.1070950655.squirrel@www.netfids.com>
References: <3FD54CCC.5080904@netfids.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD54CCC.5080904@netfids.com>
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
To: netfilter@lists.netfilter.org

Friends,

Additionaly, the Redhat9 Firewall is an IBM xSeries 345, it has 3 intefac=
es
NetXtreme 1000 T, 2 integrated Intel Ethernet 1000 and a 3con 10/1000

alias eth0 3c59x
alias eth1 tg3
alias eth2 tg3
alias eth3 tg3
alias eth4 e1000
alias eth5 e1000


Maybe could be the tg3 driver that is failing with ip alias?

> Hi Friends,
>
> Actually I have a firewall running RedHat 8 with almost the latest
> kernel (from RH).
> The interface eth0 has many aliases and there is a nat rule:
>
> iptables -t nat -A POSTROUTING -s 10.x.x.x/16 -j SNAT --to-source
> 200.x.x.10-200.x.x.21
>
> (200.x.x.10-200.x.x.21 are IP aliases)
>
> Everthing works fine, but when I try to do the same on RedHat9 (other
> box) running the latest kernel it doesnt works. Only works with the IP
> address of the interface (no alias), like this:
>
> iptables -t nat -A POSTROUTING -s 10.x.x.x/16 -j SNAT --to-source
> 200.x.x.9
>
> What is happening? why dont works SNAT with aliases? or maybe is not a
> netfilter problem?
>
>
> Thanks in advance.
>
> Geffrey Vel=E1squez.




