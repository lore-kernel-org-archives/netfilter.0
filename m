From: guestoo@www.capicom.sn
Subject: need help !Greetings.
Date: Thu, 14 Nov 2002 08:51:12 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211140847430.10078-100000@www.capicom.sn>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a Redhat 7.2 box and 8.0 box  i have a problem to use my ata some 
one help me pls 
this is my network 
 

               
               +--------+          +---------+
 internet |---|| router |--eth0--||firewall||---| intranet 192.168.1.0/24
               +--------+          +---------+
             206.10.12.1            |
				    |
				    |
				_________
				|	|
				|D M Z	|------- 206.10.12.3 (ata 186)
				---------	 	
i write this one inside my rule
#nat
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 206.10.12.2

# Don't nat our public adresses
iptables -t nat -A POSTROUTING -s 206.10.12.0/24 -j ACCEPT

inside my routeur is not possible to joint ata box ???? :(


