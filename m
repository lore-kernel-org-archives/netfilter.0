From: "Raghavan, Srihari" <srihari.raghavan@viasat.com>
Subject: RE: iptables v1.2.1a - packets not reaching tun(0) from eth0 inte
	rfac e
Date: Tue, 22 Oct 2002 06:53:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B370C63B487FD51196760002557CEABA3CD964@courier.vmd.viasat.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@newkirk.us'" <netfilter@newkirk.us>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi Joel
   Thanks for your mail.
   I am sorry but I do not see a mistake there since I have specified a
destination address (during PREROUTING for mangle table) via the -d option.
   What I want is that TCP packets (say telnet) to the machine itself (on
172.17.27.18(eth0)) should not go through my main iptables rule (MARK
PREROUTING rule) and hence 'tun0'.
   The MARK PREROUTING rule is meant for catching all TCP packets not
destined to this machine.
   About the OUTPUT rule, it is still incomplete. I should have taken that
rule out before posting.

Thanks
Srihari
-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us]
Sent: Tuesday, October 22, 2002 3:21 AM
To: Raghavan, Srihari; 'netfilter@lists.netfilter.org'
Subject: Re: iptables v1.2.1a - packets not reaching tun(0) from eth0
interfac e


On Monday 21 October 2002 06:37 pm, Raghavan, Srihari wrote:
> Hi all,
>
> I have a linux machine that needs to catch TCP packets (not meant for
> itself) that come on its eth0 interface and pass it on to tun0 interface
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

You're ACCEPTing in mangle prerouting?  Great, so the packet passes that 
chain.  You've done nothing to it though, except give it ticket out of 
PREROUTING, so that it never hits your MARK rule.  The OUTPUT ones would 
never get hit by this at all, since that's for output from the local
machine, 
but you do the same there.

> Any clues?
>
> Thank you for your time
> Srihari

j

