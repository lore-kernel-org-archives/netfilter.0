From: =?unknown-8bit?q?an=FDl?= pazvant <oybet@hotmail.com>
Subject: About iptables
Date: Thu, 15 May 2003 08:42:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F112wDjKqc3eQI00021eb1@hotmail.com>
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



  Dear Sir,

  In my company, we have 128kb Cable Modem but we do not have static 
IP.However We want internet users to access one of our local computer.How 
can we manage this? Here is my iptables notes about REVERSE NAT ..but i 
cannot managed it..
  Thanks
An&#305;l Pazvant


iptables -t nat -A PREROUTING -i eth0 -p tcp  --dport 80 -j DNAT 
--to-destination  192.168.0.5:80
iptables -t nat -A PREROUTING -i eth1 -p tcp  --dport 1111 -j DNAT 
--to-destination 192.168.0.5:80

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


