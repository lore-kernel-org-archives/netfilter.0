From: Erik <erikev@gmail.com>
Subject: Re: QoS with netfilter
Date: Sat, 10 Dec 2005 10:14:04 -0800
Message-ID: <bab495710512101014g6909071s2e69552681c39cd3@mail.gmail.com>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
	<200512101357.44378.arny@ats.s.bawue.de>
	<bab495710512100528h5103dd81t35a56afe726a7b7b@mail.gmail.com>
	<1134232492.31448.0.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1134232492.31448.0.camel@anduril.intranet.cartel-securite.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org, Thilo Schulz <arny@ats.s.bawue.de>

dscp is not important. You have a suggestion how to set TOS?

I would ideally like to controll the whole byte. Either TOS or DSCP and ECN=
.

How can I change all these bits (i.e. the whole byte) with the
netfilter mangle table or other?

On 12/10/05, Cedric Blancher <blancher@cartel-securite.fr> wrote:
> Le samedi 10 d=E9cembre 2005 =E0 05:28 -0800, Erik a =E9crit :
> > The entire http://www.lartc.org/lartc.html has not a single reference
> > to setting DSCP.
>
> Why is DSCP so important to you ? Basicly, you can use TOS to do exactly
> the same thing (it's the same field, different version).
>
>
> --
> http://sid.rstack.org/
> PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!
>

