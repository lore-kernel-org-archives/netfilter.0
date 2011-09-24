From: Hans de Bruin <jmdebruin@xmsnet.nl>
Subject: packets skipping dnat rule and someting else
Date: Sat, 24 Sep 2011 15:59:49 +0200
Message-ID: <4E7DE255.1070805@xmsnet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

There are things happening in my firewall I do not understand.

The firewall has three networks: internet, dmz and lan. Hosts in de dmz 
and lan networks are SNATed on there way out onto the internet. In the 
dmz there is a host running rtorrent which I have told it should report 
the internet ip-address of the firewall to its clients. Torrent clients 
on the internet are DNATed to the host in the dmz. On average there are 
10 clients.

I see two types of packets running into the INPUT chain of the firewall 
I am not expecting there:

A packet I think should be on its way to de rtorrent-host in the dmz. 
DST contains my internet address an DPT has the port I am running 
rtorrent on:

[22734.688709] CHAINv4=in_int IN=eth3 OUT= 
MAC=00:30:18:a6:c0:f2:00:0e:00:00:00:01:08:00 SRC=186.207.156.227 
DST=92.254.124.152 LEN=40 TOS=0x00 PREC=0x00 TTL=112 ID=27025 DF 
PROTO=TCP SPT=62434 DPT=16881 WINDOW=0 RES=0x00 RST URGP=0

Wat is the above packet doing in the INPUT chain of the firewall?

A packet on its way out. The dmz host should send it to somewhere on the 
internet but not directly to the firewall adress.

[25139.574051] CHAINv4=in_dmz IN=br_dmz OUT= 
MAC=fe:ff:ff:ff:ff:ff:00:00:00:00:00:12:08:00 SRC=10.20.0.12 
DST=92.254.124.152 LEN=60 TOS=0x08 PREC=0x00 TTL=64 ID=48601 DF 
PROTO=TCP SPT=35639 DPT=16881 WINDOW=14600 RES=0x00 SYN URGP=0

?

Parts of my firewall script:

net_lan=10.10.0.0/16
net_dmz=10.20.0.0/16

if_int=eth3

ip_int=92.254.124.152
ip_darkstar=10.20.0.12

iptables -A PREROUTING -t nat -i $if_int -p tcp --dport 16881 -j DNAT 
--to-destination $ip_darkstar
iptables -A PREROUTING -t nat -i $if_int -p udp --dport 16881 -j DNAT 
--to-destination $ip_darkstar


iptables -A POSTROUTING -t nat -o $if_int -s $net_lan -j SNAT --to $ip_int
iptables -A POSTROUTING -t nat -o $if_int -s $net_dmz -j SNAT --to $ip_int

Should I add a port range to the SNAT rules?

-- 
Hans






