From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables v1.2.1a - packets not reaching tun(0) from eth0 interfac e
Date: Tue, 22 Oct 2002 03:21:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210220321.29749.netfilter@newkirk.us>
References: <B370C63B487FD51196760002557CEABA3CD962@courier.vmd.viasat.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B370C63B487FD51196760002557CEABA3CD962@courier.vmd.viasat.com>
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
To: "Raghavan, Srihari" <srihari.raghavan@viasat.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Monday 21 October 2002 06:37 pm, Raghavan, Srihari wrote:
> Hi all,
>
> I have a linux machine that needs to catch TCP packets (not meant for
> itself) that come on its eth0 interface and pass it on to tun0 interfac=
e
> (through the TUN/TAP driver). I am using Linux 2.4.12 kernel.
>
> 1. I use the following iptables/ip rules commands after opening the tun
> device:
>
> system("ip addr add 172.17.27.18 peer 10.99.99.99 dev tun0");
> system("ip link set dev tun0 up");
> system("iptables -t mangle -A PREROUTING -d 172.17.27.0/24 -j ACCEPT");
> system("iptables -t mangle -A OUTPUT -d 172.17.27.0/24 -j ACCEPT");
> system("iptables --verbose -t mangle -A PREROUTING -i eth0 -p tcp \
>         -d 0.0.0.0/0 -j MARK --set-mark 1");
> system("iptables -t mangle -A OUTPUT -p tcp -d 0.0.0.0/0 -j MARK \
>         --set-mark 1");
> system("ip rule add fwmark 1 table 200");
> system("ip route add default dev tun0 table 200");

{snip extra details}

You're ACCEPTing in mangle prerouting?  Great, so the packet passes that=20
chain.  You've done nothing to it though, except give it ticket out of=20
PREROUTING, so that it never hits your MARK rule.  The OUTPUT ones would=20
never get hit by this at all, since that's for output from the local mach=
ine,=20
but you do the same there.

> Any clues?
>
> Thank you for your time
> Srihari

j

