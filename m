From: "Jorge I. Davila L." <davila@cablenet.com.ni>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 12:36:31 -0600
Message-ID: <1129055791.2415.79.camel@vyatka-39.cablenet.com.ni>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<434C0DED.8060203@supportivo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434C0DED.8060203@supportivo.org>
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
To: Daniel Ivanov <sertys@supportivo.org>
Cc: netfilter@lists.netfilter.org

well .. the complete rule:

iptables -A OUTPUT -p tcp -m iprange \
--src-range 192.168.223.1-192.168.223.2 \
-j ACCEPT

iptables: No chain/target/match by that name


El mar, 11-10-2005 a las 22:09 +0300, Daniel Ivanov escribi=F3:
> Well, you should try applying a target to that rule , try -j ACCEPT or=20
> -j DROP
>=20
> Jorge I. Davila L. wrote:
>=20
> >Hello list!:
> >
> >I'm trying to use the iprange match, but every time when I want apply a
> >rule I receives:
> >
> >iptables: No chain/target/match by that name
> >
> >I'm using a 2.4.30 kernel in a xen domainU
> >
> >The iptables that I'm using is 1.3.3
> >
> >The rule that I'm testing is:
> >
> >iptables -A OUTPUT -p tcp -m iprange --src-range
> >192.168.223.1-192.168.223.2
> >
> >Someone can tell me where is the problem?
> >
> >Best regards,
> > =20
> >
--=20
Jorge Isaac Davila Lopez


