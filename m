From: "Rakotomandimby (R12y) Mihamina"
	<mihamina.rakotomandimby@etu.univ-orleans.fr>
Subject: Re: just a remind
Date: Fri, 13 May 2005 14:36:42 +0200
Message-ID: <1115987802.4561.49.camel@ngeza>
References: <1115985215.4563.37.camel@ngeza>
	<090301c557b3$fdac09c0$09603fca@southern>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <090301c557b3$fdac09c0$09603fca@southern>
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

On Fri, 2005-05-13 at 17:35 +0530, hareram wrote:
> you need to Drop all and allow what are the services required
> that is the best practice

Yes, the policy is to drop.

But is REJECT a terminatig target?=20
(I just dont remember)

I know that ACCEPT is "terminating". I mean if a packet matches and is
ACCEPTed, it is not processed by the following rules.


--=20
ASPO Infog=E9rance       http://aspo.rktmb.org/activites/infogerance
Unofficial FAQ fcolc   http://faq.fcolc.eu.org/
LUG sur Orl=E9ans et alentours (France).
T=E9l : 02 34 08 26 04 / 06 33 26 13 14


