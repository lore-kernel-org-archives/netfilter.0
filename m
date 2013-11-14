From: Jim Mellander <jmellander@lbl.gov>
Subject: Re: iptables as landmine subnet rejector
Date: Thu, 14 Nov 2013 09:12:07 -0800
Message-ID: <CADju=b5v+BhTrqXm1gm5h8Q6vB-ufV_FLRcg8cjA75zV9rfvgQ@mail.gmail.com>
References: <CADju=b7zs7uGryLgM-R9_zSohh7Vknr52LL75Xx28dQyeEXgGw@mail.gmail.com>
	<CADju=b6PKTwOmO39YnHSd_6RxMfxgEDPV=jna-NzC2RSZYMSnQ@mail.gmail.com>
	<20131113221711.GA9944@home>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20131113221711.GA9944@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Oester <kernel@linuxace.com>
Cc: netfilter@vger.kernel.org

Thanks, I appreciate it, and it works fine.  However an analogous
method for UDP doesn't work correctly:

Below,
myip = host running the iptables that responds to...
landmine = subnet that is responded by myip (doesn't actually exist)
landmine_host = an ip in landmine subnet
bad_host = host on internet accessing landmine subnet

*nat
# nothing

*filter
-A FORWARD -d landmine -p udp -j REJECT


tcpdump output:
1384448210.669303 IP bad_host.23870 > landmine_host.61871: UDP, length 20
1384448210.669325 IP myip > bad_host ICMP bad_host udp port 61871
unreachable, length 56

Note that the ICMP port unreachable didn't come from landmine_host, as expected.



Here is natting all udp packets to myip, and the correct response
*nat
# UDP response for landmine nets
#  We send to a closed port, which causes the kernel to respond
-A PREROUTING -d landmine -p udp -j DNAT --to-destination myip:999

*filter
-A INPUT -p udp -d myip --dport 999 -j REJECT

tcpdump output:
1384447478.656874 IP bad_host.23703 > landmine_host.1819: UDP, length 20
1384447478.656887 IP landmine_host > bad_host: ICMP bad_host udp port
1819 unreachable, length 56


-----------------------------

I'm running SL 6.2 which is a recompile of RHEL 6.2 in case thats important

in sysctl.conf:

net.ipv4.ip_forward = 1


myip is where these landmine subnets are routed to, but they do not
really exist, we just want to respond to pings, tcp connection
attempts, and udp inbound

On Wed, Nov 13, 2013 at 2:17 PM, Phil Oester <kernel@linuxace.com> wrote:
> On Wed, Nov 13, 2013 at 09:58:13AM -0800, Jim Mellander wrote:
>> For tcp, I tried the simpler
>> -A INPUT -d a.b.c.d/xx-p tcp -j REJECT --reject-with tcp-reset
>
> If this isn't intended for the firewall itself, you should not
> add this to the INPUT chain.  Try FORWARD instead.
>
> Phil
