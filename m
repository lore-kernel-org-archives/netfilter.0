From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Drop firstly? Drop at the end of the Script? Or it doesn't
	matter?
Date: 24 Mar 2003 17:45:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048524334.14735.15.camel@tux.rsn.bth.se>
References: <000801c2ef5b$e3e3ba50$0400000b@laptopbak1>
	 <3E7F279A.9070303@giganet.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E7F279A.9070303@giganet.cz>
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
To: Ales Stibal <astib@giganet.cz>
Cc: giannhsp <giannhsp@oslab.teipir.gr>, Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-03-24 at 16:43, Ales Stibal wrote:

> IMO is better to set DROP as default policy and allow only the traffic 
> you *really* need.
> I use DROP for INPUT and FORWARD. I have ACCEPT for OUTPUT on my home box.
> This approach will fit nearly all easy installations.

I can almost guarantee that if you set the default policies to DROP you
will lock yourself out of the machine sometime :)
I usually add a -j DROP rule at the end instead so that if I get the not
so bright idea to flush the INPUT chain I won't be locked out.

The downside is that you can't just append rules with -A since the -j
DROP rule will drop the packets before the newly appended rules are
checked. IIRC someone sent a patch quite some time ago that made it
possible to write something like this to add a rule second last in the
chain:

iptables -I INPUT -2 -s x.x.x.x -j ACCEPT

I can find that quite usefull so I'll see if I can find that patch and
convince Harald into accepting it :)

-- 
/Martin

