From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Need help have some questions...
Date: 25 Aug 2003 22:30:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061843428.1507.86.camel@kermit>
References: <20030825200507.25987.qmail@web40207.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030825200507.25987.qmail@web40207.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: SBlaze <dagent.geo@yahoo.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-08-25 um 22.05 schrieb SBlaze:
> > Now, what does the circuit relay do? Does it just amplify the signal? O=
r does
> > it terminate, reconstruct and forward the information?
> >=20
> Ralf seems to disagree that the second layer is a bridge... I never thoug=
h of a
> bridge as a dumb proxy...but thats essentially what it is right?? Anyway =
this
> isn't really the focus of what I want to know...=20
Circuit Relay operates on Application layer. A typical circuit relay is
socks. It just forwards connections.

> So if I understand what Ramen is saying. It is possible to do this with a
> module  that could be loaded into iptables. Aside from the CPU argument i=
s
> there any other reason why this isn't being done? It seems to come up tim=
e and
> time again.
>=20
You could, if you would write the module. But this is better done in
userspace.=20
> > >=20
> Again no one really shed any light on what I'm supposed to do here. What =
proxy
> am I supposed to use? Everyone is saying use a proxy but no one is giving=
 any
> specifics as to what kind or what software?.
Sure, I did: Use Apache. Apache can work as a webserver for you on your
Linux box and at the same time as a proxy for the Windows box.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

