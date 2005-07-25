From: Joubert Berger <joubertb@gmail.com>
Subject: Re: iptables-restore vs iptables-restore --noflush performance
Date: Mon, 25 Jul 2005 16:46:30 -0400
Message-ID: <63d3731e05072513464c3fdf9b@mail.gmail.com>
References: <63d3731e050725121353083b32@mail.gmail.com>
	<42E53D24.2020203@SCampbell.net>
Reply-To: joubert@berger-family.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E53D24.2020203@SCampbell.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Steven M Campbell <Netfilter@scampbell.net>
Cc: netfilter@lists.netfilter.org

Actually, what I do is load the first time the 6600 rules.  The next
time I load the 6600 rules, I load them using different chains.  At
the end, I just change FORWARD to point to the newly created chains
and then delete the old chains.

Are you saying, if I have 6600 rules loaded, no matter what chain I
add the next 6600 rules (i.e. totaly new chain), performance is going
to go up?  In other words, performance (inserting of rules) is tied to
# of total rules and not # of rules added to a chain?

TIA

--joubert


On 7/25/05, Steven M Campbell <Netfilter@scampbell.net> wrote:
> Joubert Berger wrote:
> >Anyone know why I would get a big performance difference between
> >"iptables-restore" and "iptables-restore --noflush"?
> >
> >I have 6600 rules.  If I load with iptables-restore, it takes about 30se=
c.
> >If I use noflush, that turns in 1 min and 20+ seconds.
> >
> >--joubert
> >
> >
> Because you have 6600 rules and when you use no-flush you are adding
> another 6600?  If you do it several
> times in a row I'll bet the time keeps getting worse.
>=20
> The insert time for each rule is, among other things, dependent on the
> number of rules that
> must be searched/manipulated, thus an explanation for the times you see.
>=20
> You should only use --noflush if you really intend to add rules to the
> current  rule set rather
> than replace them all.  What are you trying to accomplish here?
>=20
>=20
>=20
>

