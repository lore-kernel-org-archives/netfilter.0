From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FreeS/WAN + static NAT + 2 machines
Date: Mon, 23 Sep 2002 11:48:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231048.g8NAmDv24210@vulcan.rissington.net>
References: <OF4CF55ADA.1F646FD5-ONC1256C3D.003385BB-C1256C3D.003482E1@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF4CF55ADA.1F646FD5-ONC1256C3D.003385BB-C1256C3D.003482E1@GEHAG-DSK.DE>
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
To: netfilter@lists.netfilter.org

On Monday 23 September 2002 10:33 am, Walther@gehag-dsk.de wrote:

> my setup is this one:
>
> <LAN>---<firewall>---<freeswan gateway>---<firewall with static
> nat>--<cisco(only routing)>---<internet>

Interesting.   Why do you have two separate firewalls, plus a FreeS/WAN 
gateway ?   I would have thought:

a) one firewall would be sufficient (obviously the one inside the IPsec 
gateway, so it can filter unencrypted traffic)

b) you should be able to run the firewalling, the NAT, and IPsec all on a 
single machine (what speed is your Internet link ?)

c) if necessary, you could put the IPsec machine on a DMZ interface of the 
firewall to keep its traffic separate from the internal LAN

Anyway, given the setup you have:

> I want to nat incoming connections for the freeswan gateway. but up to now
> I wasn't able to do this.

I assume you are running IPsec in tunnel mode (network at both ends, Security 
Gateways encrypting traffic and acting as routers, not endpoints), rather 
than transport mode (one or both Security Gateways is an endpoint of the data 
communication).

Provided you are using tunnel mode, you can NAT IPsec traffic.   The ESP 
protocol works through NAT.

If you are using transport mode, you cannot NAT IPsec traffic.   The AH 
protocol breaks under NAT.

> I tried the following:
>
> <--snip-->
>
> iptables -t nat -A POSTROUTING -o $EXT -s <internal_ip_for_freeswan> -j
> SNAT --to <external_ip_for_freeswan>
> iptables -t nat -A PREROUTING -i $EXT -d <external_ip_for_freeswan> -j
> DNAT --to <internal_ip_for_freeswan>
> iptables -A FORWARD -p 50 -d <internal_ip_for_freeswan> -j ACCEPT
> iptables -A FORWARD -p 51 -d <internal_ip_for_freeswan> -j ACCEPT
> iptables -A FORWARD -p udp --dport 500 -d <internal_ip_for_freeswan> -j
> ACCEPT

Those rules are okay, but do you also have FORWARDing rules to allow data 
*out* from the FreeS/WAN machine as well as into it:

iptables -A FORWARD -p udp --dport 500 -s <internal_ip_for_freeswan> -j ACCEPT

etc. ?

(By the way, you could tighten that rule slightly because you know the source 
port is 500 as well as the destination port, so specify both --sport 500 and 
--dport 500 to make sure it really is IKE traffic).

> but this won't work for me. maybe somebody of you can help me with fixing
> this issue.

The other thing which might be relevant is your ipsec.conf files on the two 
Security Gateways: the standard FreeS/WAN instructions tell you to put the 
same configuration file on both ends, however when you are using NAT in 
between the two Gateways, the rule becomes:

the configuration file on each IPsec machine must contain the addresses for 
the local and remote machines, as known to the local machine.

Thus the machine in your diagram above would have its internal IP address in 
its own configuration file, but the IPsec machine at the other end would have 
this machine's external IP address in its configuration file.

Does that help?

What do you see in your /var/log/messages when you try to start FreeS/WAN 
running ?


Antony.


By the way, I have a really complicated diagram on a whiteboard which shows 
how packets travel through the various chains / tables of netfilter on a 
machine also running FreeS/WAN - if you ever consider setting up a single 
machine to do your filtering, NAT and IPsec I'll figure out a way to get you 
a copy so you can understand what rules you need and what addresses to expect 
where.....

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

