From: "black@arbbs.net" <black@arbbs.net>
Subject: RE: Destination Nat
Date: Fri, 04 Jun 2004 09:45:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40c09902.2c9.1bbe.570207397@arbbs.net>
Reply-To: black@arbbs.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


the rule set:
iptables -t nat -A PREROUTING -d 5.6.7.8 -p 6 --dport 80 -j
DNAT --to 192.168.x.x:80 worked perfectly

thank you

but i have a new question.  i'm trying to setup so the users
can access the machines through ssh.  

here is the rule set:
iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp --dport 22
-j DNAT --to 192.168.1.88:22

the problem is when i ssh in to machine8 which is on static
ipaddress 192.168.1.88 i actully log into machine1 which is
192.168.1.81, which is the first machine in the rule set. 
where did i go wrong?

thanks
john 


