From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Security question
Date: Mon, 01 Mar 2004 13:55:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <404332A5.1000500@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-List <netfilter@lists.netfilter.org>

What is the potential security problem if you have network as follows:

SOLUTION 1

INET-CABLE MODEM-----------------|
ROUTER-eth0-public IP address----|
ROUTER-eth1-private IP address---|------->SWITCH
ROUTER-eth2-private IP address---|
Internal server for mail,web-----|
all LAN users with private IP----|


SOLUTION 2

INET-CABLE MODEM-->eth0-ROUTER|--eth1|
			       --eth2|-->SWITCH
		 server and LAN users|

I am thinking of the solution 1 because cable modem is a little bit to 
far away from the router and I don't want to use to much of the cables. 
I have setup router with MAC address filtering and also put firewall on 
all internal computers.

What is possible security problem comparing the 2 solutions above?

Regards,
Sasa

