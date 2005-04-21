From: varun_saa@vsnl.net
Subject: 2 subnets
Date: Thu, 21 Apr 2005 19:18:33 +0500
Message-ID: <a3382a6979.a6979a3382@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
      My server is on Mandrake10.1
eth0 is WAN with static IP connected to 512Kbps DSL.

We have two subnets :

   192.168.0.0/24
   192.168.21.0/24

Clients on both subnets will browse, send/
recieve mails and use MSN or Yahoo chat.

Right now I am using eth1 as LAN as follows :

eth1   - 192.168.0.0/24
eth1:1 - 192.168.21.0/24

Right now I am using shorewall. But I would like
to switch to iptables.

My question is having seperate network card 
for each subnets a better option.

eth1 and eth2.

Or eth1 and eth:1 is also fine

Thanks

Varun


