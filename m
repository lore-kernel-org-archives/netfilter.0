From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: Dropping network "noise"
Date: Sun, 13 Feb 2005 16:30:44 +0300
Message-ID: <200502131630.44293.e-boogie@yandex.ru>
References: <200502130928.41225.e-boogie@yandex.ru>
	<1108296226.10876.16.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1108296226.10876.16.camel@nostromo.bgsecm.com>
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
To: netfilter@lists.netfilter.org

On Sunday 13 February 2005 15:03, Jose Maria Lopez Hernandez wrote:
> El dom, 13-02-2005 a las 09:28 +0300, Mikhail Zotov escribi=C3=B3:
[snip]
> > Can the following rules do any harm?
> >=20
> > iptables -A FORWARD -i $EXTERIOR_INTERFACE -d $LAN.BROADCAST -j DROP
>=20
> If you are don't want to receive traffic your broadcast it's OK.
>=20
> > iptables -A FORWARD -i $EXTERIOR_INTERFACE -d ! $LAN.IP.ADDRESSES.RANGE=
 -j DROP
>=20
> And this it's another anti-spoofing rule. I'll tell you the same that
> for the previous rule. It's OK if the $LAN.IP.ADDRESSES.RANGE it's OK.

Thank you very much for the answer.
I'm really glad the rules don't break any network things
I am not aware about yet. :-)

Regards,
Mikhail

