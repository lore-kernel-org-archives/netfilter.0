From: Deepak Baskaran <deepak.baskaran@ericsson.com>
Subject: Iptables NAT : RST for SYNACK issue
Date: Fri, 30 Mar 2012 09:56:45 +0200
Message-ID: <9819C11BC6C68B4F820C87D7C7AC7A303A062F910B@ESESSCMS0365.eemea.ericsson.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
  Would really appreciate if you can help in my issue.
This is my network
PC[147.xxx.xxx.xxx] ------>[eth0 : 10.184.19.28:13566 NAT   eth0 : 10.184.19.8:any]------------------->DEST [eth0:10.184.19.30:13566]
I need to access DEST from PC via NAT. I can access DEST directly from the PC, but my req. is that I need to route the packets via NAT.
So, I send packets from PC to NAT, where I use iptables rules to NAT'em to DEST.

The following are the iptables rules:
"
iptables -A INPUT -i eth0 -p tcp -d 10.184.19.28 --dport 13566 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --source 10.184.19.30 --sport 13566 -d 10.184.19.28 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 10.184.19.28 --dport 13566 -j DNAT --to-destination 10.184.19.30:13566
iptables -t nat -A POSTROUTING -p tcp -o eth0 -j MASQUERADE
"

This my issue:
The SYN from the pc reaches the 10.184.19.30:13566, and the same sends a SYNACK reply back.
However, the NAT server 10.184.19.28 resets the connection on reception of SYNACK. 
Am I missing anything with reverse NAT in the rule? I'd really appreciate your help.
If needed I can also give you packet trace.

Thanks
Deepak

