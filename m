From: "Kleiner, Peter" <kleinerp@smbmicro.com>
Subject: YAPFQ (Yet Another Port forwarding Question)
Date: Thu, 4 Dec 2003 15:59:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDAFEC98D318F74CA26B5A26F2B4965227C5E0@exchange.jfctechnologies.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Folks,

Try as I might, I am missing something as far as getting port
forwarding to work.  I have tried this on RH 9, and now on 
Slackware 9, and get the same results.  

I have a regular script that works on another machine, but 
even the simplest trial does not work:

root@gw:~# echo 1 > /proc/sys/net/ipv4/ip_forward
root@gw:~# iptables -t nat -A POSTROUTING -d ! 10.1.1.0/24 \
-j MASQUERADE
root@gw:~# iptables -t nat -A PREROUTING -p tcp -i eth0 \
-d 66.153.4.7 --dport 143 -j DNAT --to 10.1.1.6:143
root@gw:~# iptables -A FORWARD -p tcp -i eth0 -d 10.1.1.6 \
--dport 143 -j ACCEPT

iptables -n -L -v shows traffic on the imap port:

root@gw:~# iptables -n -L -v
Chain INPUT (policy ACCEPT 582 packets, 40585 bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain FORWARD (policy ACCEPT 3 packets, 222 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    3   144 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            10.1.1.6
tcp dpt:143 

Chain OUTPUT (policy ACCEPT 3145 packets, 254K bytes)
 pkts bytes target     prot opt in     out     source
destination         
root@gw:~# iptables -n -L -v -t nat
Chain PREROUTING (policy ACCEPT 1838 packets, 133K bytes)
 pkts bytes target     prot opt in     out     source
destination         
    1    48 DNAT       tcp  --  eth0   *       0.0.0.0/0
66.153.4.7         tcp dpt:143 to:10.1.1.6:143 

Chain POSTROUTING (policy ACCEPT 22 packets, 1292 bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain OUTPUT (policy ACCEPT 4 packets, 269 bytes)
 pkts bytes target     prot opt in     out     source
destination         

But I always get:
Could not open connection to the host, on port 143: Connect failed

The following modules are loaded:
root@gw:~# lsmod 
Module                  Size  Used by    Tainted: P  
ipt_state                536   0  (autoclean)
ipt_MASQUERADE          1272   0 
iptable_nat            14904   1  [ipt_MASQUERADE]
ip_conntrack           18016   2  [ipt_state ipt_MASQUERADE iptable_nat]
iptable_filter          1644   1  (autoclean)
ip_tables              11768   6  [ipt_state ipt_MASQUERADE iptable_nat
iptable_filter]

I think that the forwarding part is working, because I set up another
PC on the internal LAN to use this box as the default router, and am
able to reach the Internet through it.

Is there another step I'm missing?  Help, please!

Thanks in advance!

PK

