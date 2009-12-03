From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: NAT issue, help
Date: Thu,  3 Dec 2009 17:38:56 +0100
Message-ID: <20091203173856.97035zl2wcptve04@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org
Cc: vhuertas@indra.es

Hi all,

I am trying to set up the following configuration, so a SIP client in  
the private LAN can communicate with any client outside (Client C):

Client A
    |          private LAN           public
-------------------------- Gateway ----------------------
    |      192.168.xx.xx/24          10.1.xx.xx/24       |
Client B                                            Client C

The gateway makes NAT correctly, but so far it has been impossible  
that it changes the private IP in the Contact field of the clients in  
the LAN for the public IP of the gateway outside. In consequence,  
Client C always faces a non-routable IP.

I am using nf_conntrack_sip and nf_nat_sip loaded in my iptables  
config script but they seem not been working.

My iptables config script is like this:

/sbin/modprobe nf_conntrack
/sbin/modprobe nf_conntrack_sip sip_direct_signalling=0 sip_direct_media=0
/sbin/modprobe nf_nat_sip

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p udp --dport 5060 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --dport 5060 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.1.xx.xx

I really appreciate any help.

Thanks in advance,
Rebeca Martinez

