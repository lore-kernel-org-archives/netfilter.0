From: Jay Schulist <jschulist@bivio.net>
Subject: Re: [PATCH] associate user defined name with rule match
Date: Thu, 19 Sep 2002 07:41:40 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209190738360.5702-100000@beavis.networkrobots.com>
References: <20020919074625.007828aa.adam@vbfx.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020919074625.007828aa.adam@vbfx.com>
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
To: Adam Young <adam@vbfx.com>
Cc: netfilter@lists.netfilter.org

On Thu, 19 Sep 2002, Adam Young wrote:

> 	Isn't this already available via --log-prefix ?  I've been using that for the
> longest time, and if I want to see all hits on port 1433, I just say "grep MSSQL
> /var/log/messages", for example, and it brings all of those up.
> 

Actually this match is simpiler than that, it only displays a user defined
string for a rule on an iptables -L or iptables-save.

It does this for the benefit of parsing through rules. This is used by
some people to allow automated generation/regeneration of rulesets.

jay-s.

> > Hello Harald,
> > Here is a new match which allows the user to associate a name with a rule.
> > It is a very simple match, but it is useful if the user needs an easy way
> > to track a rule by name.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.7 (GNU/Linux)
> 
> iD8DBQE9ibkRUanLvazj+VgRAjTHAJ9Wk6JZa11FTKyXB/BF095x1hBunQCfXH/S
> jfF1zT8Gn7cbstJNVSUN6uI=
> =MN++
> -----END PGP SIGNATURE-----
> 


