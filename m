From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Patch-o-matic help
Date: Mon, 7 Jul 2003 13:50:10 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307071345550.16552-100000@localhost>
References: <200307031501.00905.sysadmin_lists@iwa-solutions.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307031501.00905.sysadmin_lists@iwa-solutions.com>
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
To: System Administrator <sysadmin_lists@iwa-solutions.com>
Cc: netfilter@lists.netfilter.org

Hello, Mr Administrator,

> I have iptable 1.26 setup on a Redhat 8 server.  This server also needs to 
> function as a PPTP VPN server.  It appears that PoPToP is the only reasonable 
> way to acomplish that.  I can get PoTPoP to work but I am told that I need to 
> be able to pass GRE packets.
>   It looks like there is a patch to do this but requires patch-o-matic.  
> Looking at the README, it looks like I run a command called runme.  and then 
> recompile the Kernel.
>   I'm yet to go through the recompile.  Anybody willing to help the 
> inexperienced become experienced?

You don't need any patch-o-matic, the functionality is built into iptables
since long ago. You just need to allow in Protocol 47 (GRE) as well as TCP
port 1723 (PPTP control channel). So the following rules should do it:

iptables -I INPUT -i <external-interface> -p tcp --dport 1723 -j ACCEPT
iptables -I INPUT -i <external-interface> -p 47               -j ACCEPT

If you only need connections from certain IP addresses, then you can 
narrow this down in order to protect your PPTP server from intruders.

By the way, if you make a custom kernel with the PPTP NAT patch, then it 
may cause problems with running a PPTP server on the same machine (at 
least, I saw this in one case, but I didn't build that kernel so I don't 
know exactly which patch was used).

Cheers, Chris.
--
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


