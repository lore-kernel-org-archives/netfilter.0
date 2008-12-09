From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: routing to forward a service request to another machine with iptables.
Date: Tue, 9 Dec 2008 05:55:46 +0100
Message-ID: <002a01c959ba$666e17d0$334a4770$@info>
References: <307438.64180.qm@web76715.mail.sg1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <307438.64180.qm@web76715.mail.sg1.yahoo.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> We use inbit for our internal company communication among the
> employees. The inbit server is located in our internal LAN (without
> public IP). Inbit Server has IP of 192.168.1.1 .
> 
> Some of the users those mobile needs the inbit too.
> 
> The mobile users do login to Inbit Server through our internet
> gateway whose public IP and the IP is 219.83.114.179 . The Inbit
> service port number is 10883.

[...]

> ======
> 
> I want the incoming packet in 219.83.114.179:10883 will be
> forwarded to 192.168.1.1:10883.
> 
> But I don't know how to forward the PREROUTING / SNAT.
> 
> This are what I've done:
> ======
> mysussy:~ # iptables -I FORWARD 1 -i eth0 -o eth1 -p tcp -s 0/0 -d
> 219.83.114.179 --dport 10883 -j ACCEPT
> mysussy:~ # iptables -D FORWARD 1
> mysussy:~ # iptables -D INPUT 1
> mysussy:~ # iptables -I INPUT 1 -p tcp -s 0/0 -d 219.83.114.179 -i
> eth0 --dport 10883 -j ACCEPT
> mysussy:~ # iptables -I FORWARD 1 -i eth0 -o eth1 -p tcp -s 0/0 -d
> 219.83.114.179 --dport 10883 -j ACCEPT

- If you want to forward packets, in the filter table you only use the FORWARD chain: not the INPUT or OUTPUT chain so this won't work.
- If I'm not mistaken, you can't specify "-o eth1" in the PREROUTING chain.
- Finally, if you want to specify "any" ip, you don't need to specify "0/0". You can just omit it which makes the rule more readable.

> mysussy:~ # iptables -t nat -I PREROUTING 1 -i eth0 -o eth1 --dport
> 10883 -J SNAT --to-destination 192.168.1.1
> iptables v1.4.0: Unknown arg `--dport'
> Try `iptables -h' or 'iptables --help' for more information.
> ======

The error means that iptables doesn't know what protocol you want to match, but you did specify the port. You need to specify "-p tcp" or "-p udp" here.

Try this (assuming your routing table is correct):

$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i eth0 -o eth1 \
  -d 192.168.1.1 -p tcp --dport 10883 -j ACCEPT
$ipt -t nat -A PREROUTING -i eth0 -d 219.83.114.179 -p tcp \
  --dport 10883 -j DNAT --to 192.168.1.1

- The first rule will accept all packets in a connection once it has been setup.
- The second rule will (only) match the first packet in the connection specified by this rule and accept it. Remember you want to forward packets to 192.168.1.1 so for the FORWARD chain, that's the destination IP.
- The third rule specifies how to NAT the packet. Here the destination IP is your public IP and you DNAT only packets to 10883/tcp to 192.168.1.1.


Grts,
Rob


