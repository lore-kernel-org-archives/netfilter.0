From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: bug? blocked packets get shadowed to internal network
Date: Thu, 14 Aug 2003 12:47:50 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308141245120.31438-100000@localhost>
References: <20030814133901.B23470@rcs.ei.tum.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030814133901.B23470@rcs.ei.tum.de>
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
To: Juergen Stohr <juergen.stohr@lpr.e-technik.tu-muenchen.de>
Cc: netfilter@lists.netfilter.org

Hi Juergen,

> we are using a firewall with RedHat kernel 2.4.20-19.7. The firewall is
> configured to block every packet with DPT 199 into our network.

You haven't given us your ruleset. Are you using a REJECT rule, especially 
with TCP reset?

> IN= OUT=eth0 SRC=xxx.xxx.151.184 DST=xxx.xxx.11.231 LEN=40 TOS=0x00 PREC=0x00 TT
> L=255 ID=0 DF PROTO=TCP SPT=199 DPT=34869 WINDOW=0 RES=0x00 ACK RST URGP=0

This looks like a completely standard TCP reset. I can't tell for sure 
without seeing your ruleset, but I suspect that either you are blocking 
the incoming packet with -j REJECT --reject-with tcp-reset, or else it's 
not being blocked at all, and what you see is the kernel resetting the 
connection in the normal way (since it's not listening on that port).

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


