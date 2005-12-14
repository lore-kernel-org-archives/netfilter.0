From: =?ISO-8859-1?Q?Bj=F8rn_Ruberg?= <bjorn@ruberg.no>
Subject: Re: opening port for SSH
Date: Wed, 14 Dec 2005 23:06:25 +0100
Message-ID: <43A09761.8050400@ruberg.no>
References: <000001c600d3$c48640b0$0101000a@sterenborg.info>
	<uizoe3jefxt.fsf@false.linpro.no>
	<20051214203623.GF21572@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20051214203623.GF21572@metastasis.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Nick Drage <nickd@metastasis.org.uk>
Cc: netfilter@lists.netfilter.org

Nick Drage wrote:
> On Wed, Dec 14, 2005 at 06:39:26 +0100, Bj=F8rn Ruberg wrote:

[...]

> In order to bind to the correct port wouldn't the existing SSHD pro=
cess
> need to be killed?  Or at least redirected to listen on another por=
t so
> the "shady" process could act as an intermediary.  For that to happ=
en
> wouldn't the attacker need root privileges anyway?

There are several ways to escalate privileges, most of which are not=
=20
netfilter related.

The point I was trying to make is that important services should not =
be=20
told to listen to ports above 1024.

--=20
Bj=F8rn


