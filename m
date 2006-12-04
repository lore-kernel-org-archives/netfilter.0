From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Multiple Mac Addresses as Source
Date: Mon, 04 Dec 2006 13:18:22 +0100
Message-ID: <4574120E.8040407@plouf.fr.eu.org>
References: <7e53eda20612040406g714db122s34870004374153df@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7e53eda20612040406g714db122s34870004374153df@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hello,

Syed AbuBakr a =E9crit :
>=20
> I want to use multiple mac addresses as source for my rules, well they
> r in hundreds. if i make a file of these mac addresses and give it's
> path instead of writing hundreds of rules.so my question is that is
> their any way to input them as a file.or file path?

Check ipset.
<http://www.netfilter.org/projects/ipset/index.html>

