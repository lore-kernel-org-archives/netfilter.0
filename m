From: Ludo Stellingwerff <ludo@protactive.nl>
Subject: RE: mangle, filter & FORWARD
Date: Wed, 02 Jun 2004 08:34:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086158045.4482.19.camel@laptop.stwerff.xs4all.nl>
References: <20040602051716.80453.qmail@web41705.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040602051716.80453.qmail@web41705.mail.yahoo.com>
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
To: "Kevin D. White" <web_crawlz@yahoo.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

<<snip>>
> > 
> > Nope (thankfully)
> I know now that there are two FORWARD chains,
> mangle.FORWARD and filter.FORWARD.  They have the same
> name and are the same chain structure, they will
> contain completely different rules.

It's quite confusing for people used to working with ipchains:)
The terminology changed a bit:

Chains are now called tables and you have 3 root-tables: mangle, nat and
filter. To select them you would use the '-t' option of iptables,
defaulting to 'filter'.

Then you have 5 'hooks': the places in the network subsystem where these
tables can be used:
PRE-ROUTING, INPUT, FORWARD, OUTPUT, POST-ROUTING

Differents hooks accept different tables: 
the mangle table at all-5 hooks.
the nat table at OUTPUT, PRE- and POST-ROUTING.
and filter table at INPUT, FORWARD and OUTPUT.

> >Not all tables
> > are run on each chain. Eg. FORWARD table only has
> > mangle/filter.
> 
> Ok, you must mean "not all the chains are used in each
> table", right?  "The FORWARD chains only appear in the
> mangle and filter tables", yes?
>  

Therefore it was the correct terminology: not all tables are tun on each
chain (hook).
In ipchains it was the other way around.

> > 
> > For a really good refreence on iptables in general,
> > check out
> > http://iptables-tutorial.frozentux.net/
> 

Did you check the http://lartc.org/howto/ ?
It very clear and handson.

Greetings,

Ludo Stellingwerff.




