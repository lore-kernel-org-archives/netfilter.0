From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: [Fwd: [suse-security] iptables rules for HTML Form Protocol
 Attack]
Date: Mon, 14 Jul 2003 10:54:16 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307141028560.10510-100000@localhost>
References: <1057826036.4367.1.camel@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1057826036.4367.1.camel@linux.local>
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
To: Ruprecht Helms <rhelms@mayn.de>
Cc: Muammer.Arslan@experteach.de, netfilter@lists.netfilter.org

Hi all,

> > From: Muammer Arslan <Muammer.Arslan@experteach.de>
[...]
> > Last days I often see below messages in Apache log files:
> > 1.1.1.1         - - [09/Jul/2003:17:32:00+0200] "POST http://11.1.106.18:25/ HTTP/1.1" 200 475 "-" "-"
> >
> > I suspect some kind of HTML protocol attack and want to stop this.
> > Can I do it somehow with IP-Tables as it is already installed on the
> > server or do you have any other ideas? I use SuSE 8.1 and
> > SuSEfirewall2 with SuSEfirewall2-custom rules.

iptables is a firewall which works at the IP packet layer, while this is
an attack against the HTTP protocol layer. Specifically, the attacker is
asking a proxy server to connect to a mail server, which it should never
allow.

If you can block all external access to your proxy server, you should do
so, and this can be done at the IP layer using iptables. For example,
assuming that your firewall and proxy server are separate 
machines, and that the attacker is outside your network and the 
proxy is inside, you can add a rule to block access to the proxy with a 
command like this on the firewall:

  iptables -I FORWARD -i <external-interface> -d <proxy-server> \
	-p tcp --dport <proxy-port> -j DROP

But you would still be better off (more secure) if you deny access to all 
services (including the proxy) which you have not explicitly decided to 
allow.

If you must provide public access to your proxy server (which is a VERY 
bad idea in my opinion), then it would be easier and more secure for you 
to configure the proxy server not to allow POST and CONNECT requests to 
ports other than 80 (and possibly 443). 

The only way to do this with iptables is to abuse the string match (from 
patch-o-matic) to detect and drop packets which contain the words "POST " 
and ":25". This will cause you false positives and is easy to bypass, so I 
don't recommend it.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |



