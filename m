From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port forwarding across two firewalls
Date: Tue, 11 May 2004 09:33:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405110933.25194.Antony@Soft-Solutions.co.uk>
References: <000301c4369f$8f8710b0$0f01020a@taita>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000301c4369f$8f8710b0$0f01020a@taita>
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

On Monday 10 May 2004 4:00 pm, R D wrote:

> Hi all,
>
> I sent this before but got no reply...is there nobody out there that can
> help me!?

I'll have a go, but please confirm I understand correctly what you need to 
do...

> I have a static IP (10.2.1.15) on which I need to have both TCP and UDP
> ports 5000 appearing to be external! The subnet I'm on has a
> firewall(Debian) with an int IP 10.2.1.1 & ext 10.1.1.77 with gw 10.2.1.1
> obviously. The second firewall/router is a US Robotics ADSL
> Modem/Router with int IP 10.1.1.1 & ext 1.2.3.4.

So, is this your setup?

Internet
    |
1.2.3.4
US Robotics ADSL
10.1.1.1
    |
10.1.1.77
Debian netfilter
10.2.1.1
    |
Your subnet

And you want a machine 10.2.1.15 on your subnet to be accessible on TCP & UDP 
ports 5000 using public IP address 1.2.3.4?

> When I lived in a house with just a Debian firewall and nothing configured
> on the modem the following worked:
>
> iptables -A FORWARD -p udp -d 10.2.1.15 --dport 5000 -j ACCEPT
> iptables -A PREROUTING -t nat -p udp -d fw-ext --dport 5000 -j DNAT --to
> 10.2.1.15:5000
>
> iptables -A FORWARD -p tcp -d 10.2.1.15 --dport 5000 -j ACCEPT
> iptables -A PREROUTING -t nat -p tcp -d fw-ext --dport 5000 -j DNAT --to
> 10.2.1.15:5000

Looks simple and effective, yes.

> I've tried the same commands with fw-ext=10.1.1.77 and setting a 'port
> range mapping' on the modem 10.1.1.77:5000-1.2.3.4:5000 for both UDP/TCP,
> but to no avail!

Put a packet sniffer on the link between US Robotics ADSL and the Debian 
netfilter, or else add some LOGging rules to the netfilter, and check that 
the ADSL router is forwarding (and NATting) the packets through correctly.

Since you have successfully used the above rules on a different system, and 
they look correct to me too, I think any problem is on the US Robotics ADSL, 
not on the Debian netfilter.   Therefore start by checking that the netfilter 
system is receiving some packets to pass on.

I would check carefully that the "port range mapping" you have described is 
bidirectional - it has to NAT and forward packets both ways through the ADSL 
router (the description you've given above makes me wonder if the rule 
applies outbound only?).

Regards,

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


