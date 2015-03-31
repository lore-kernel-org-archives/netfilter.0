From: Dmitry Melekhov <dm@belkam.com>
Subject: connmark and nat
Date: Tue, 31 Mar 2015 11:10:02 +0400
Message-ID: <551A484A.7050208@belkam.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!

I'm trying to do DNAT/SNAT on the same host with connmark and can't get 
it working.

My host has static ip 192.168.22.252 and it can get address 
192.168.22.99 from VRRP, so bind doesn't listen on 192.168.22.99,
but if host got this address it has to answer on it the same as on 
192.168.22.252.

So , if traffic goes to 192.168.22.99 port 53 udp, I need to redirect it 
to 192.168.22.252:53,
and if it was to 192.168.22.99 host need to reply from this address.

DNAT part works:

#mark
iptables -t mangle -A PREROUTING -d 192.168.22.99 -p udp --dport 53 -j 
CONNMARK --set-mark 0x100

#restore mark inside connection
iptables -t mangle -A PREROUTING -d 192.168.22.99 -p udp --dport 53 -j 
CONNMARK --restore-mark


#do NAT
iptables -t nat -A PREROUTING -m mark --mark 0x100 -j DNAT 
--to-destination 192.168.22.252


Don't know is is correct or not, but at least it works.


But SNAT doesn't:

#restore mark
iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark

#do nat
iptables -t nat -A POSTROUTING -m mark --mark 0x100 -j SNAT --to-source 
192.168.22.99


I see that no packets hit rule:

     0     0 SNAT       all  --  *      *       0.0.0.0/0 
0.0.0.0/0            connmark match  0x100 to:192.168.22.99


Could you, please, tell me what is wrong here?

Thank you!
