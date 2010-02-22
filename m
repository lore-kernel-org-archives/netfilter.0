From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: RTSP and iptables
Date: Mon, 22 Feb 2010 10:35:47 +0100
Message-ID: <20100222103547.251334awhmdhuvi8@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org
Cc: vhuertas@indra.es


Hello all,

I have the following scenario:

Private client <-------- > Firewall machine <----------> Streaming Server

The streaming Server offers two types of services: VoD (by means of  
RTSP) as well as broadcasting. The last one is running without  
problems once I included some rules in my iptables configuration and  
with the help of igmpproxy.

However, there is no way I can make the client display the unicast  
video. The firewall permits the ports agreement (TCP), but then with  
the UDP messages it answers both the client and the server with an  
ICMP Destination unreachable message.

My iptables configuration is like this:

# Forward:
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
#iptables -A FORWARD -i eth1 -o ppp0 -j ACCEPT
iptables -A FORWARD -p udp --dport 5060 -j ACCEPT
iptables -A FORWARD -p udp --dport 4060 -j ACCEPT

# Enabling VLC streaming broadcast:
iptables -I FORWARD -s 10.1.xx.xx/24 -d 224.0.0.0/4 -j ACCEPT
iptables -I INPUT -d 224.0.0.0/4 -j ACCEPT
iptables -I FORWARD -d 224.0.0.0/4 -j ACCEPT

#Enabling VLC VoD:
iptables -A INPUT -s 192.168.50.0/24 -m tcp -p tcp --dport 30000:65000  
-j ACCEPT
iptables -A INPUT -s 192.168.50.0/24 -m udp -p udp --dport 30000:65000  
-j ACCEPT
iptables -A INPUT -s 10.1.xx.xx/24 -m tcp -p tcp --dport 30000:65000 -j ACCEPT
iptables -A INPUT -s 10.1.xx.xx/24 -m udp -p udp --dport 30000:65000 -j ACCEPT
iptables -A FORWARD -s 192.168.50.0/24 -m tcp -p tcp --dport  
30000:65000 -j ACCEPT
iptables -A FORWARD -s 192.168.50.0/24 -m udp -p udp --dport  
30000:65000 -j ACCEPT
iptables -A FORWARD -s 10.1.xx.xx/24 -m tcp -p tcp --dport 30000:65000  
-j ACCEPT
iptables -A FORWARD -s 10.1.xx.xx/24 -m udp -p udp --dport 30000:65000  
-j ACCEPT

Please, there is anybody who has any tip or could help me?

Thanks in advance,
Rebeca Martinez
