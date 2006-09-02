From: Eric Leblond <eric@inl.fr>
Subject: Re: Hardly loaded machines and iptables? Your experiences?
Date: Sat, 02 Sep 2006 20:59:27 +0200
Message-ID: <1157223567.5248.5.camel@localhost.localdomain>
References: <20060902174858.44865.qmail@web56212.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060902174858.44865.qmail@web56212.mail.re3.yahoo.com>
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
To: Elvir Kuric <omasnjak@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le samedi 02 septembre 2006 =E0 10:48 -0700, Elvir Kuric a =E9crit :
> Hi all,=20
> How that works in  environment with many
> reqestes to servers in the LAN, I mean about 10000
> request per day?

Per day are you sure ? or do you mean per second ? ;-)
10000 per day is completly out of scale compare to heavy loaded
firewall.

> Have you experience about this topic.

Netfilter benchark document by kdlec is really good:
http://people.netfilter.org/kadlec/nftest.pdf


> What do you think is solution based on iptables enough
> secure for mission critical cases? I just need your
> frank opinion.

Clearly yes.

Don't forget that most of the firewall vendors (checkpoint for example)
uses linux as OS. And almost all UTM are Linux/netfilter based.

BR,
--=20
Eric Leblond <eric@inl.fr>


