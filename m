From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Error responce when limiting access
Date: Mon, 7 Jul 2003 15:03:15 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307071501260.16552-100000@localhost>
References: <3F0953DB.BB9B3B4@danbbs.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F0953DB.BB9B3B4@danbbs.dk>
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
To: Mogens Valentin <monz@danbbs.dk>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi Mogens,

> Using iptables, I can of cause deny access to cirtain IP addresses or
> websites, however, I'd like to make sure clients do not just get a
> timeout, not found or something alike.
> AFICS, it'll be difficult to set some errorresponce a browser can
> understand, allowing it to display a meaningful errorresponce.

Use a DNAT rule to redirect them to a local web server, or a Squid proxy 
which is configured to deny all requests. Then you can configure these 
to serve up a suitable error page which you can design yourself.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


