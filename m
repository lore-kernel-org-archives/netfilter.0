From: ads nat <adsnat@yahoo.com>
Subject: Iptables rule for multiple Ip addresses.
Date: Mon, 14 Jun 2004 22:35:49 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040615053549.29391.qmail@web60408.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Hi,
I am using Redhat Linux 9.0 with Iptables iptables
v1.2.7a.
I am trying to apply this rule for diverting trafic. 
"eth1" is LAN interface for subnet 192.168.0.0/24
##########
[root@xxx root]# iptables -t nat -A PREROUTING -s
192.168.0.2-192.168.0.10 -i eth0 -p tcp -j DNAT --to
10.0.0.2:80
iptables v1.2.7a: host/network
`192.168.0.2-192.168.0.10' not found
Try `iptables -h' or 'iptables --help' for more
information.
##########

It seems it does not accept multipal source addresses.
I sther any other wat do achieve this.
Thanks for support.




	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

