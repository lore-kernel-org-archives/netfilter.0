From: angico <angico@yahoo.com>
Subject: Re: Total dropped packet count
Date: Sun, 19 Feb 2006 02:21:49 -0800 (PST)
Message-ID: <20060219102149.61989.qmail@web36809.mail.mud.yahoo.com>
References: <BAY106-F3432AE74D95FBC338D3533D6F80@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY106-F3432AE74D95FBC338D3533D6F80@phx.gbl>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

hi!
i think you'd like to have a look in the section "match extensions" of
the iptables man page. the first of them is "account" that you could
use for your joy.
angico.


--- Andrew Kraslavsky <andykras@hotmail.com> wrote:

> Hello,
>=20
> Is there a way to get from iptables/netfilter the total number of
> dropped=20
> packets?
>=20
> The way we do this at the moment is with a script that:
>=20
> 1) Lists all the rules
> 2) Finds within that list all rules whose target is DROP
> 3) Adds up the packet count for each of those rules
>=20
> This seems to work okay but it is cumbersome.
>=20
> I'm hoping there's some nice little /proc counter or iptables command
> that=20
> will give me the total count of dropped packets.
>=20
> Thanks,
>=20
> Andrew Kraslavsky
>=20
> _________________________________________________________________
> Don=92t just search. Find. Check out the new MSN Search!=20
> http://search.msn.click-url.com/go/onm00200636ave/direct/01/
>=20
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

