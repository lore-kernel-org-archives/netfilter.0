From: "Doug Yeager" <doug@aircomwireless.net>
Subject: denying local traffic
Date: Tue, 11 Feb 2003 11:06:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2d1e7$990976a0$bb00a8c0@DOUG1>
References: <3E49130A.70805@wm1.at>
Reply-To: <doug@aircomwireless.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E49130A.70805@wm1.at>
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
To: netfilter@lists.netfilter.org


I'm using nocat as a wireless gateway w/ the hostap driver. This is 

Great because I should be able to use iptables firewall rules to 

Administer things. I've had some success w/ these rules as I'm new to 

iptables.

 

What I can't figure out is how to block local traffic between clients 

on the LAN. Basically, I want them to be invisible to each other but 

be able to get to the internet through the gateway.

Right now they can get to the internet but can see each other's shares

and so forth.

 

What should be the iptables commands for doing this.

 

My lan is 192.168.19.0/255.255.255.0

 

Help would be great as I've attempted many things w/o success.

 

Thx,

doug




