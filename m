From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables performance
Date: Wed, 25 May 2005 17:25:24 -0400
Message-ID: <20050525212523.GA18093@bender.817west.com>
References: <e208f5d1050525122040c9003a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <e208f5d1050525122040c9003a@mail.gmail.com>
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

On Wed, May 25, 2005 at 07:20:53PM +0000, Martin Schi=F8tz wrote:
> Hi=20
>=20
> I'm planning to set up a bridge running iptables on an uplink of a lot
> of internet user. The uplink is on maximum at about 30 mbit/s. There
> are about 1800 * /29 ip nets - some /29 nets needs to be stopped be
> the bridge and some can pass. I'm wondering about the performance of
> iptables when having 1800*2 rules worst case (PREROUTING rules on src
> and dst nets).

sounds like a job for ipset [1].  if you have 1800 nets that fall into 2
categories, you'd have 2 rules, 1 for set 1 and 1 for set 2.  depending
how the nets break down on CIDR boundaries, you could auto-summarize the
nets that have the same rules to be applied to them.

-j

[1] - http://people.netfilter.org/kadlec/ipset/

--
"Quagmire: Don't look at me like that. Fat chicks need love too... but
 they got to pay."
        --Family Guy

