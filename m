From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: How to disable ip_contrack_irc when its compiled into the kernel?
Date: Fri, 27 Dec 2002 19:47:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003801c2add8$58da06e0$026410ac@honor>
References: <1041008143.15849.81.camel@fish-dt.dmz.dynam.ac> <3E0C9B9F.80200@shortcircuit.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Justin Hammond <fish@dynam.ac>, Dan Egli <dan@shortcircuit.dyndns.org>
Cc: netfilter@lists.netfilter.org

> Unfortunately, I believe that once a module is compiled into the kernel
> it's present, end of discussion. And besides. thats not quite what you
> want is it? removing ip_conntrack_irc would kill ALL irc abilities, not
> just DCC. After all, doens't IRC operate on multiple ports, similiar to
FTP?

No irc just uses a single connection for all the basic stuff (usually from a
random port/tcp clientside to port 6667/tcp serverside)

just DCC (direct client connection) uses additional ports. DCC is used for
the inter user communication.



