From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: rules disappear after a few seconds
Date: Mon, 17 Feb 2003 03:14:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302170314.43120.netfilter@newkirk.us>
References: <3E50854E.5060108@mega-bucks.co.jp>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E50854E.5060108@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

On Monday 17 February 2003 01:46 am, Jean-Christian Imbeault wrote:
> Ok, this one is bizarre. I have a small shell script to clear my
> iptables rules and then insert 9 rules. If I run my script and then do
> "iptables -n -L" my rules show up.
>
> If I keep doing "iptables -n -L" after about 10-20 seconds the rules
> disappear and I am left with three empty INPUT/OUTPUT/FORWARD tables.
>
> Where did my rules go? What made them disappear?

Does this happen if you add rules manually, from a console, or only from=20
the script? =20

I've never heard of any bug that could cause this, there must be=20
something that is explicitly removing the rules, or using "iptables -F"=20
or similar to flush rules from the chains.

If you have nat or mangle table enabled, try creating a rule in one of=20
them as well, and listing that table with "iptables -n -L nat" or "-L=20
mangle" and see if the same thing happens there.

j


