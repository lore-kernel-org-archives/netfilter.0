From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Traffic going out wrong interface
Date: Wed, 10 Sep 2003 17:51:57 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0309101747300.23381-100000@localhost>
References: <3F4D5905.9030400@chrisbrenton.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4D5905.9030400@chrisbrenton.org>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

Hi Chris,

> So it appears that something about having iptables kick back RST's 
> rather than type 3's caused the bogus ARP packets as well as the RST 
> being transmitted out the wrong interface as I described below. I'm not 
> sure if I'm the only one having this problem, but then again I'm not 
> sure how many people scrutinize layer 2 as deeply as I do. ;-)

If it is the same problem as the RSTs (which looks likely, given the
symptoms), you could try applying the latest patch-o-matic, or at least
submitted/66_netfilter-policy-routing.patch.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |



