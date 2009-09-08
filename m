From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Windows/NetBIOS & SNAT
Date: Tue, 08 Sep 2009 12:14:02 +0200
Message-ID: <4AA62E6A.4030501@chello.at>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <651562.95010.qm@web33406.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Nicholas Couchman <nick.couchman@yahoo.com>

Nicholas Couchman wrote:
> I've done quite a bit of Google searching and haven't turned up anything definitive hear.  I have a few Windows XP machines that I want to put behind a Linux/iptables NAT configuration.  The domain controllers and WINS servers sit outside the NAT configuration.  On the Linux side, I've enabled ip forwarding, and added the following rule with iptables:
>
> iptables -t nat -A POSTROUTING -s 172.16.34.0/24 -j SNAT --to-source 192.168.100.100
>
> However, I'm getting the following error when trying to log on to Windows:
> The system cannot log you on now because the domain DOMAIN is not
> available.  I've loaded the nf_conntrack and nf_conntrack_netbios_ns modules in Linux, but this hasn't helped.  I've done some packet tracing, and when I look at tcpdump, on the "inside" interface, I see requests to the WINS system but never any replies.  When I look at packets on the "outside" interface, I see the SNAT'd requests from the 192.168.100.100 interface going to the WINS server on port 138, and I see the replies coming from the WINS server to the 192.168.100.100 IP address, port 138.  Herein lies my problem - I'm guessing that the Linux system itself isn't actually expecting the reply on port 138, and so it's discarding the packet.  My question is this: is there some rule I ought to put somewhere else in iptables to have these packets returned to the "inside" network, to the 
 correct host?
>
> Oh, yeah, one other thing - all iptables is doing is NAT - there are no firewall rules that would block trafffic, and the default policy is "ACCEPT".
>
> Thanks,
> Nick
>   
Hello,

I'm just guessing, but as you do source nat, the wins server will only 
see requests from the nat source and will only reply to that address - 
trying to assign a netbios name to 192.168.100.100. I don't know about 
nf_conntrack_netbios_ns, but maybe you would need something like 
nf_conntrack_nat_netbios_ns, which I don't know if it exists.
But, do you really need the nat? Why not add the proper routes for the 
networks? There nf_conntrack_netbios_ns may do it's job within a simple 
filtering ruleset.

Regards,

Mart
