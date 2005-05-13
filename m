From: "Rakotomandimby (R12y) Mihamina"
	<mihamina.rakotomandimby@etu.univ-orleans.fr>
Subject: Re: When do iptables take effect when using iptables-restore
Date: Fri, 13 May 2005 17:58:53 +0200
Message-ID: <1115999933.4561.59.camel@ngeza>
References: <63d3731e0505130835640d8da0@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <63d3731e0505130835640d8da0@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Fri, 2005-05-13 at 11:35 -0400, Joubert Berger wrote:
> Say I have 10,000 rules loaded.

God!

> I now want to update them, so I edit my file and then run
> iptables-restore to load the new rules.

Why wouldn't you deal with a shell script to do so?
With a shell script you would exactly know what rules are applied at a
moment.

> During all this iptables is applying policy on packets.  So, what
> happens between the time I start running iptables-restore and when it
> finishes it?=20

If you update your rules, one thing you will have to do is to flush,
anyway. If you dont, you'd append your updates to the existent rules. So
once you flushed, I think your "reore" file is read line by line and the
rules are applied as well as it is read.

But that's just my opinion. I habe no technical arguments, as you
see :-)


--=20
ASPO Infog=E9rance       http://aspo.rktmb.org/activites/infogerance
Unofficial FAQ fcolc   http://faq.fcolc.eu.org/
LUG sur Orl=E9ans et alentours (France).
T=E9l : 02 34 08 26 04 / 06 33 26 13 14


