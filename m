From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Only one VPN connection
Date: Wed, 23 Jul 2003 16:31:28 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307231624300.14116-100000@localhost>
References: <NDBBKABJBJCIJNAELLKEMEODJCAA.jimm@simutronics.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NDBBKABJBJCIJNAELLKEMEODJCAA.jimm@simutronics.com>
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
To: James Miller <jimm@simutronics.com>
Cc: users@lists.freeswan.org, netfilter@lists.netfilter.org

Hi James,

> I'm cross posting this message because I'm not sure if my problem is a
> Freeswan, IPTables, or both ;).  I can establish only one VPN connection to
> our internal network.  If someone else connects, I can no-longer see our
> network, if I run ipsec.exe on my workstation (from home) I can reconnect
> and the other person gets booted off.  My firewall is acting as the Freeswan
> VPN server, I'm running Linux 2.4.21, Super-freeswan-1.99.7.3 and grsecurity
> (it doesn't matter if I have grsec enabled or disabled, I get the same
> results).  I'm sure it's something stupid that I'm missing.. and I hope that
> some additional pairs of eyes can help me determine what I'm doing wrong.

First of all, this is almost certainly a FreeSWAN issue rather than 
iptables.

I just wanted to check that you and the other user are both using
different certificates. Because uniqueids=yes, when you connect to the
server will disconnect anyone else with the same ID.

Also, I believe that you may have problems with having a subnet behind 
your road warriors. This subnet can only be routed to one peer at a time, 
so if one user is using it and another connects, the first user will lose 
their SA for that subnet, and will be unable to use it to talk to the 
server.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


