From: varun_saa@vsnl.net
Subject: smtp / pop rules
Date: Tue, 01 Feb 2005 20:02:58 +0500
Message-ID: <246c3a2246c5ff.246c5ff246c3a2@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-language: en
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
      My server is Mandrake 10.1
eth0 is WAN with static IP connected to 512k DSL
eth1 is LAN

I have already configured NAT, etc..

I want my firewall to allow users to send
and recieve mails. 

I want add the following lines to my iptables :

-A INPUT -p tcp -m tcp --sport 110 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A INPUT -p tcp -m tcp --sport 25 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 25 -j ACCEPT

Is it OK ?

thanks

Varun


      


