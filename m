From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: RE: mangle, filter & FORWARD
Date: Wed, 2 Jun 2004 11:04:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16573.60559.927239.101640@saint.heaven.net>
References: <20040602051716.80453.qmail@web41705.mail.yahoo.com>
	<1086158045.4482.19.camel@laptop.stwerff.xs4all.nl>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086158045.4482.19.camel@laptop.stwerff.xs4all.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ludo Stellingwerff writes:

> Chains are now called tables and you have 3 root-tables: mangle, nat and

This is utterly wrong.  Chains are still called chains.  See
"man iptables" and "iptables --help".  Tables are groups of
related-purpose chains.

> Then you have 5 'hooks': the places in the network subsystem where these
> tables can be used:
> PRE-ROUTING, INPUT, FORWARD, OUTPUT, POST-ROUTING

PREROUTING, INPUT, FORWARD, OUTPUT, and POSTROUTING are the names of
chains.  Fulling specifying a chain requires giving its chain name and
the table it's in.

I realize most users on the list know this, but I felt this
needed correcting for the archives.

> > > For a really good refreence on iptables in general,
> > > check out
> > > http://iptables-tutorial.frozentux.net/
> > 
> 
> Did you check the http://lartc.org/howto/ ?
> It very clear and handson.

It also has very little to do with ntfilter/iptables. 

--
Dick St.Peters, stpeters@NetHeaven.com 

