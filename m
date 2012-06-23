From: Alan Jenkins <alan.christopher.jenkins@gmail.com>
Subject: Re: SNAT/MASQ on a single subnet
Date: Sat, 23 Jun 2012 13:07:59 +0000 (UTC)
Message-ID: <loom.20120623T145657-66@post.gmane.org>
References: <1337271506.23670.13.camel@mutsumi.paige>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Andrew <nfml7 <at> k1k2.com> writes:

> 
> Hi I'm trying to work out what I guess might not be possible
> with iptables or is simple and I"m just missing something
> 
> I have 3 devices on the same subnet
> 
> 192.168.0.1 ADSL Router
> 192.168.0.240 Linux Server
> 192.168.0.100 Windows PC
> 
> The Linux server has no rules and ACCEPT on all
> 
> What would the minimum necessary rule(s) to get the Linux Server
> to forward (with SNAT or MASQUERADE) packets through the Router
> from 192.168.0.100 and also send the replies back?
> 
> The Linux Server has 192.168.0.1 as it's gateway and also
> has ip forwarding enabled
> 
> I set the gateway on the windows PC to 192.168.0.240
> 
> I tried a few simple single rules and failed.
> (Just the single rule and deleted it after)
> 2 examples were:
> 
> iptables -t nat -A POSTROUTING -o br0 -s 192.168.0.0/24 ! -d
> 192.168.0.0/24 -j SNAT --to 192.168.0.240
> 
> iptables -t nat -A POSTROUTING -o br0 -s 192.168.0.0/24 -j SNAT --to
> 192.168.0.240
> 
> Single ping shows:
> 192.168.0.100 -> 74.125.237.113
> 192.168.0.240 -> 74.125.237.113
> 74.125.237.113 -> 192.168.0.240
> 
> but no "74.125.237.113 -> 192.168.0.100"

[snip tcpdump]

Right, looks like you have a rule working for one way, but not the other...  But
you don't want to just Translate the Network Address (NAT).  Because you're
trying to share one IP address between two machines.  You also need to translate
the Port as well (NAPT), so that you share your tcp/udp port space between the
Linux server and the Windows machine...

> Anyone know what it should really be (or if it isn't possible why?)
> 
> Thanks for your help.

I think you want

iptables -t nat -A POSTROUTING -o br0 -j MASQUERADE

(grabbed from http://tldp.org/HOWTO/IP-Masquerade-HOWTO/firewall-examples.html).

Regards
Alan

