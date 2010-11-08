From: Michele Codutti <michele.codutti@uniud.it>
Subject: [SOLVED] Re: ClusterIP and MAC NAT
Date: Mon, 08 Nov 2010 17:36:20 +0100
Message-ID: <1289234180.6644.33.camel@nerino>
References: <1288103438.2727.69.camel@nerino>
	 <4CC70D22.20109@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC70D22.20109@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> I have an install that is dealing with a cranky switch that can't see 
> the same MAC addresses on multiple VLANs where I am doing almost exactly 
> this for 30(ish) VLAN interfaces.  It has been in production for five 
> years and working great.  (Recently I upgraded the system, carrying the 
> old ARPTables / EBTables / IPTables scripts / configs forward.)
> 
> > Now the problem is with the arp queries. In need to "NAT" also the 
> > queries substituting the mac address also in the payload of the 
> > packet not only in the header. Can i do that?
> 
> You will need to use ARPTables to help EBTables with the ARP problem.  I 
> will go through my backups and see if I can't find an example set of 
> rules for you to gander at.
> 
> Here's a +1 on what you are wanting to do can be done and does work. 
> You just need to look at ARPTables to assist with the ARP specific problem.

Hello everyone today I managed to nat a multicast address of a clustered
ip. So I'm writing to the ML to keep track of the solution.
The servers and the bridges all are Debian Lenny with only packaged
software, the router is a Cisco 7200 VXR.
There are only 3 ebtables rules to do the trick:
   ebtables -t nat -A PREROUTING \
      --in-interface "$OUTERFACE" \
      --protocol arp \
      --arp-opcode Request \
      --arp-ip-dst "$ip" \
      --jump arpreply \
      --arpreply-mac "$UMAC_OUI:" \
      --arpreply-target DROP
   ebtables -t nat -A PREROUTING \
      --in-interface "$OUTERFACE" \
      --destination "$UMAC_OUI:$MAC_EUI" \
      --jump dnat 
      --to-destination "$MMAC_OUI:$MAC_EUI" \
      --dnat-target ACCEPT
   ebtables -t nat -A POSTROUTING \
      --out-interface "$OUTERFACE" \
      --protocol arp --arp-opcode Request \
      --arp-ip-src "$ip" \
      --jump snat \
      --snat-arp \
      --to-source "$UMAC_OUI:$MAC_EUI" \
      --snat-target ACCEPT
Where:
 - $ip is the cluster ip shared by servers;
 - $OUTERFACE is the interface of the bridge connected
   on router ethernet segment;
 - $MMAC_OUI is the multicast OUI part of the MAC address;
 - $MMAC_OUI is the unicast OUI part of the MAC address;
 - $MAC_EUI is the final part of the MAC address.

Special thanks to Grant Taylor.

