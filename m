From: "Julian Stefanov" <hackdevil@hotmail.com>
Subject: Problem with MSN Messenger Voice Chat and ICQ Voice Chat.
Date: Thu, 12 Feb 2004 17:19:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law10-F660LClVNpBPs0003335d@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Problem with MSN Messenger Voice Chat and ICQ Voice Chat.

My situation is:
_____     _____________      ____      _______________________
|       |    |in eth0 (RealIP)|    |       |    |                            
             |
| ISP |-->|    Slackware    |-->| HUB|-->| LOCAL AREA (6 Computers)|
|      |    |         9.0         |    |       |    |      10.0.0.2 - 
10.0.0.7       |
|      |    |out eth1 (Local)|    |      |     |                             
            |
|      |    |     10.0.0.1     |     |       |    |                          
               |
--------     -----------------------      --------     
------------------------------------------
My ISP give me 13 Real-IPs. 1st Real-IP (80.xxx.xxx.xx1) is on the eth0 
adapter on Linux Slackware machine. All other Real-IPs are on the virtual 
eth0:1, eth0:2, eth0:3 etc.
eth1 is my other adapter with first local IP.
I uses iptables to make the nat for Local Area.
My iptables are:
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.2 -o eth0 -j SNAT --to 
80.xxx.xxx.xx2
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.3 -o eth0 -j SNAT --to 
80.xxx.xxx.xx3
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.4 -o eth0 -j SNAT --to 
80.xxx.xxx.xx4
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.5 -o eth0 -j SNAT --to 
80.xxx.xxx.xx5
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.6 -o eth0 -j SNAT --to 
80.xxx.xxx.xx6
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.7 -o eth0 -j SNAT --to 
80.xxx.xxx.xx7
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.8 -o eth0 -j SNAT --to 
80.xxx.xxx.xx8
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.9 -o eth0 -j SNAT --to 
80.xxx.xxx.xx9
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.10 -o eth0 -j SNAT --to 
80.xxx.xxx.x10
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.11 -o eth0 -j SNAT --to 
80.xxx.xxx.x11
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.12 -o eth0 -j SNAT --to 
80.xxx.xxx.x12
/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.13 -o eth0 -j SNAT --to 
80.xxx.xxx.x13
All of this working fine, but I can't establish Voice connection with MSN 
Messenger and ICQ.
Local Area computers working with WindowsXP Pro. They uses my Linux machine 
for Gateway and DNS Server.
I can make voice connection with MSN Messenger only on my local area. For 
example 10.0.0.2 MSN Messenger Voice Chat to 10.0.0.5 MSN Messenger Voice 
Chat.
Thank you in advance.
Julian

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus


