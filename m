From: Lorenzo Allegrucci <lorenzo.allegrucci@forinicom.it>
Subject: Re: SIP vs NAT, the configuration
Date: Thu, 17 Dec 2009 12:45:25 +0100
Message-ID: <4B2A19D5.3020809@forinicom.it>
References: <20091217120216.17864m4cx9o37fy8@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091217120216.17864m4cx9o37fy8@ek2pim.upc.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rebeca.martinez-garcia@estudiant.upc.edu
Cc: netfilter@vger.kernel.org, vhuertas@indra.es

rebeca.martinez-garcia@estudiant.upc.edu wrote:
> 
> Hi all,
> 
> I have finally managed to configure my iptables so SIP clients under NAT 
> can make calls outside and clients outside can call clients in the LAN.
> The aim of this email is to post my configuration as a help for those 
> trying to configure iptables in the same way.
> 
> Firstly, it is necessary to be sure that you have kernel support for 
> modules nf_conntrack_sip and nf_nat_sip:
> 
> cng@cng:/etc/ser$ modprobe -l | grep sip
> kernel/net/netfilter/nf_conntrack_sip.ko
> kernel/net/ipv4/netfilter/nf_nat_sip.ko
> 
> If you do not have them, then you will need to build the kernel with 
> support for them (but my kernel is 2.6.31 and they are by default).
> 
> So next step is to configure the iptables script. I have made comments 
> so everybody can understand:
> 
> # Load modules:
> /sbin/modprobe ip_tables
> /sbin/modprobe iptable_nat
> /sbin/modprobe iptable_filter
> /sbin/modprobe nf_conntrack
> /sbin/modprobe nf_nat
> 
> # To load nf_conntrack_sip and nf_nat_sip is important to respect the 
> order:
> # first nf_conntrack_sip and then nf_nat_sip.
> # If your SIP connection is to dest. udp port 5060 then it is not 
> necessary to # add "ports=5060,4060", but if you have the problem that 
> is to another portm tring 
> # that the SIP connection is to be done, then the structure is 
> "ports=5060,xxx
> # were xxx is your port. (I think you can add up to 8 ports, not sure)
> 
> /sbin/modprobe nf_conntrack_sip ports=5060,4060 sip_direct_signalling=0 
> sip_direct_media=0
> /sbin/modprobe nf_nat_sip

Hi,

can you match all voip (SIP+RTP) traffic with the above commands?

I'm trying to setup some QoS rules to match voip traffic by nf_conntrack_sip,
but I can't find a way to match all traffic, I can match just a small fraction of it.
(no NAT, tried all combinations of sip_direct_signalling and sip_direct_media)
