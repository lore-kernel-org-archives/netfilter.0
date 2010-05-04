From: "Pavel Mikulka" <pavel@mikulka.info>
Subject: Brouting VNC
Date: Tue, 4 May 2010 17:26:46 +0200
Message-ID: <003601caeb9e$35bb2de0$a13189a0$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: cs
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everyone,

I have topology with virtual machines running on KVM like this:

eth0 (ip 1.1.1.1)
eth1 --\
	  > --> bond0 (ip 1.1.1.2) --> br0 --> Virtual Machine with ip
1.1.1.3
eth2 --/

I would have a RDP available from outside at the ip address of virtual
machine. I try to configure ebtables/iptables to redirect VNC from ebtables
to iptables and then to ip address of host 1.1.1.1(or localhost) with no
luck. 

ebtables -t broute -A BROUTING -i bond0 -p IPv4 --ip-protocol 6
--ip-destination-port 5900 -j redirect --redirect-target DROP
iptables -t nat -A PREROUTING -p tcp  -d 1.1.1.3 --dport 5900 -j DNAT --to
1.1.1.1:5900
 
Any help will be appreciated. Thanks

P.



