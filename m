From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 10:24:55 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310301023510.18336-100000@localhost.localdomain>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57909@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57909@OST_EXCH_USR5>
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
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Thu, 30 Oct 2003, Knight, Steve wrote:

> Thanks to both the Robs [and the other contributors I hope I've thanked
> already!] :D
> 
> At the moment, it's a single host - but it will eventually be acting as the
> single gateway for a 192.168.x.x LAN + DMZ, and I will be implementing a
> fairly strict ruleset on the FORWARD chain [there are some monkeys who'd be
> Kazaaing and IRCing in a moment if I didn't] - which is why I'm trying all
> sorts of mojo on the INPUT/OUTPUT chains right now so I can get comfortable
> with the syntax.
> 
> Ive relented for the moment [for testing purposes] to OUTPUT ACCEPT policy
> and of course it's working as expected, but I'm intrigued as to why the
> rules didn't work.

so add a logging rule like:

  iptables -A INPUT -p tcp --dport 53 -j LOG

or something to that effect to see what happens to that traffic
when it comes in, then tail the file /var/log/messages.  at least
you'll see the traffic.

rday


