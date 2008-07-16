From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: icmp-redirect
Date: Wed, 16 Jul 2008 09:56:12 -0500
Message-ID: <487E0C0C.8030709@riverviewtech.net>
References: <004c01c8e6b8$f215b920$0200640a@wtlc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004c01c8e6b8$f215b920$0200640a@wtlc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/15/08 15:25, Andrea Bencini wrote:
> I have a local network (10.100.0.0/24) and my default gateway is a 
> firewall (fw;eth0=10.100.0.1) with linux OS and netfilter.
> In the same network I have an other gateway (linux OS and netfilter) to 
> connect a local subnetwork (10.6.70.0/24). Gateway eth0 is 10.100.0.241 
> and gateway eth1 is 10.6.70.241.
> In the local network (10.100.0.0/24) I have windows client (XP prof) and 
> default gateway of these is 10.100.0.1.
> I want implement "icmp redirect" in the firewall (default gateway); What 
> do I have to add or to change in my firewall?

Are you sure that it is not happening already?  There are some /proc 
entries controlling how Linux behaves regarding ICMP redirects (should 
it listen to and / or send them) that you can change.  I think they both 
are enabled by default, though your distro may throb them.

/proc/sys/net/ipv4/icmp_ratemask
/proc/sys/net/ipv4/icmp_ratelimit
/proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
/proc/sys/net/ipv4/icmp_echo_ignore_all

I think you will be most interested in the last two.  Check kernel 
documentation (<kernel source>/Documentation/networking/ip-sysctl.txt) 
for more information.



Grant. . . .
