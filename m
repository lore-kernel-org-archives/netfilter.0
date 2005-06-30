From: umar draz <umar_draz@yahoo.com>
Subject: multiple gateways in linux
Date: Thu, 30 Jun 2005 04:41:01 -0700 (PDT)
Message-ID: <20050630114101.35127.qmail@web53110.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

hi dear members!

  i have 2 DSL connection from diffrent companies. i
attached both DSL modem in my Linux Machine with
different ethernet. 

i have 4 enternet devices in my linux machine

local network
eth0 = 192.168.1.1
eth1 = 10.0.0.1

DSL network
eth2 = 202.147.167.6 & gateway 202.147.167.1
eth3 = 202.157.170.3 & gateway 202.157.170.1

this machine work as a router now i want when a
request come from 192.168.1.0/24 network it should out
through my eth2 gateway (202.147.167.1)

and if request from 10.0.0.0/24 network should out
through eth3 gateway (202.157.170.1)

regards

Umar Draz


		
____________________________________________________ 
Yahoo! Sports 
Rekindle the Rivalries. Sign up for Fantasy Football 
http://football.fantasysports.yahoo.com

