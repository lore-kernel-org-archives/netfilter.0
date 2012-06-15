From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Iptables Drop rule - strange behaviour
Date: Fri, 15 Jun 2012 17:36:23 -0400
Message-ID: <201206151736.23942.neal.p.murphy@alum.wpi.edu>
References: <CACJKonoWuj1=He00eD7e9YENHXvwEY1Hmg6_Cjq5GeYT6DchoQ@mail.gmail.com> <CACJKonpcSF2X2PPBZzg_ZuEO6FNvPQ6AQEH4nSQWf4natD36=w@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACJKonpcSF2X2PPBZzg_ZuEO6FNvPQ6AQEH4nSQWf4natD36=w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday 15 June 2012 15:01:15 sreejith menon wrote:
> Hi,
> 
> I have the below setup for my firewall and i am using iptables 1.4.9.1 v
> 
> 
> Client PC (eth0, 172.31.114.239)--------------(eth0 172.31.114.252)
> Firewall Router (eth1, 10.2.2.2)--------------------Network PC
> (10.2.2.1)
> 
> I have set the default policy as accept for my testing purpose. My aim
> is to prevent ssh from Client PC to Network PC. But allow ssh from
> Network PC to Client PC.
> 
> I have the following iptables rule
> 
> iptables -nvL
> 
> Chain INPUT (policy ACCEPT 744 packets, 46652 bytes)
> 
>  pkts bytes target     prot opt in     out     source              
> destination
> 
>  9989  780K ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0           state RELATED,ESTABLISHED
> 
> 
>  Chain FORWARD (policy ACCEPT 3 packets, 180 bytes)
> 
>  pkts bytes target     prot opt in     out     source              
> destination
> 
>     82 17854 ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0           state RELATED,ESTABLISHED
> 
>     11   660 DROP       tcp  --  *      eth1    0.0.0.0/0
> 0.0.0.0/0           source IP range 172.31.114.1-172.31.114.254 tcp
> spts:2:65535 dpt:22 destination IP range 10.2.2.1-10.2.2.254
> 
> 
>  Chain OUTPUT (policy ACCEPT 1741 packets, 149K bytes)
> 
>  pkts bytes target     prot opt in     out     source              
> destination 0     0 DROP       tcp  --  *      eth1    0.0.0.0/0
> 0.0.0.0/0           source IP range 172.31.114.1-172.31.114.254 tcp
> spt:22 dpts:2:65535 destination IP range 10.2.2.1-10.2.2.254
> 
>  Observations
>  -------------------
> 
> 1. Ssh from Network PC to client PC  --- ssh successful as expected
> 2. ssh from client pc to Network PC ---- ssh blocked as expected
> 3.  Again ssh from Network PC to client PC  --- ssh  blocked which was
> not expected.
> 4. If i randomly insert some rules which has no relevance to ssh, and
> do step 1 alone again - ssh sucessful
> 5.  Again do step 2 followed by step -- ssh blocked ..problem.
> 
>  Please help or any idea will be very much appreciated
> 
> Also, noted that if i have a ssh rule to deny from client PC to
> network PC. If i do ftp, it is fine. But if i do ssh followed by ftp,
> ftp doesnt work. please note that default policy is accept all. I did
> not add or delete rules in between.

If the firewall does not employ NAT (that is, it's a 'simple' router), your 
DROP rule is close. You need a DROP rule that specifically identifies packets
  1. from the 172.X.X.X LAN (or range, or host),
  2. to the 10.X.X.X LAN (or range, or host),
  3. dest port 22,
  4. state NEW
That will drop all connection attempts from the 'outside' host (or LAN or 
range of addresses) to the 'inside' host (or LAN or range of addresses) to 
port 22, thus preventing the outside host(s) from connecting to port 22 on the 
inside. All other packets will be accepted (via your default policy).

This is not correct syntax but should illustrate the pieces needed for the 
single rule you want:
-A FORWARD -i eth0 \
           -source range 172.31.114.1-172.31.114.254 \
           -dest range 10.2.2.1-10.2.2.254 \
           -protocol tcp \
             -destport 22 \
             -m state --state NEW \
           -j DROP

If it's a NATting firewall, the solution may be more complex.
