From: "rabbtux rabbtux" <rabbtux@gmail.com>
Subject: Re: ipsec NAT pass through rule(s)?
Date: Sun, 10 Dec 2006 22:33:15 -0800
Message-ID: <5cc9c8f90612102233g68f9b03o88e68614d0082445@mail.gmail.com>
References: <5cc9c8f90612091547r4dd21922i8bf63d84b9c59c8@mail.gmail.com>
	<1165747742.5125.15.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1165747742.5125.15.camel@anduril.intranet.cartel-securite.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric,  I understand how to do nat to IPSEC ports and all others.  My
question is about any special rules required so that the encrypted
ipsec TCP headers don't get mangled?  I recall that parts of the TCP
header about the source address get encrypted and that this can break
the vpn through masqueraded (nat'ed ) connections.

On 12/10/06, Cedric Blancher <blancher@cartel-securite.fr> wrote:
> Le samedi 09 d=E9cembre 2006 =E0 15:47 -0800, rabbtux rabbtux a =E9crit :
> > Anyone have suggestions for a rule to allow IPsec packets to pass from
> > a NATed subnet??  I know linksys,dlink, et. all have a firewall
> > checkbox to alow ipsec vpns to work.
>
> IPSEC implies IP protocols 50 (ESP) and sometimes 51 (AH). Therefore,
> you have to handle them both. A (very) quick'n'dirty ESP NAT would be:
>
>         iptables -t nat -A POSTROUTING -p 50 -j MASQUERADE
>         iptables -A FORWARD -p 50 -j ACCEPT
>
> Now, just adapt this to your own situation and push some rules with
> subnet adresses, input and output interfaces, etc.
>
>
> --
> http://sid.rstack.org/
> PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!
>

