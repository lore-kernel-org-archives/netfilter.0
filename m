From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: NAT and anti spoofing
Date: Wed, 18 Sep 2002 16:29:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209181629.56408.danielf@supportteam.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter <netfilter@lists.netfilter.org>

This may be a stupid question but the answer is eluding me right now. 

With NAT setup. 

I have a single machine with 8 global IPs NATed to 8 10.0.0.0/8 IPs. How do 
you filter the 10.0.0.0/8 network from talking to the machines behind the 
firewall. From outside the firewall on the internet.  

I used command like this to get the NAT working is this right. 
iptables -t nat -A POSTROUTING -s 10.10.10.128 -j SNAT --to 1.2.3.4
iptables -t nat -A PREROUTING -d 1.2.3.4 -j DNAT --to 10.10.10.128

This worked to make 1.2.3.4 send to a machine behind the firewall that had 
10.10.10.128 for it's IP. 


Thanks

-- 
Daniel Fairchild
C I Host | danielf@cihost.com

