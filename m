From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Need help have some questions...
Date: Mon, 25 Aug 2003 13:39:05 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825203905.32224.qmail@web40207.mail.yahoo.com>
References: <1061843428.1507.86.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1061843428.1507.86.camel@kermit>
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
Content-Transfer-Encoding: quoted-printable
To: Ralf Spenneberg <lists@spenneberg.org>, nf <netfilter@lists.netfilter.org>


--- Ralf Spenneberg <lists@spenneberg.org> wrote:
> Am Mon, 2003-08-25 um 22.05 schrieb SBlaze:
> > > Now, what does the circuit relay do? Does it just amplify the signal?=
 Or
> does
> > > it terminate, reconstruct and forward the information?
> > >=20
> > Ralf seems to disagree that the second layer is a bridge... I never tho=
ugh
> of a
> > bridge as a dumb proxy...but thats essentially what it is right?? Anyway
> this
> > isn't really the focus of what I want to know...=20
> Circuit Relay operates on Application layer. A typical circuit relay is
> socks. It just forwards connections.
>=20
> > So if I understand what Ramen is saying. It is possible to do this with=
 a
> > module  that could be loaded into iptables. Aside from the CPU argument=
 is
> > there any other reason why this isn't being done? It seems to come up t=
ime
> and
> > time again.
> >=20
> You could, if you would write the module. But this is better done in
> userspace.=20
> > > >=20
> > Again no one really shed any light on what I'm supposed to do here. What
> proxy
> > am I supposed to use? Everyone is saying use a proxy but no one is givi=
ng
> any
> > specifics as to what kind or what software?.
> Sure, I did: Use Apache. Apache can work as a webserver for you on your
> Linux box and at the same time as a proxy for the Windows box.
>=20

Currently I am using Apache and I have two sites vhosted on it. The only so=
rt
thing I really use my windows box for is web browsing/multimedia that sort.=
..it
has no services available to the world. So thats whats confusing me is that
everyone says use a proxy but I don't see how using a proxy can stop those
unwanted requests. I'm trying to stop certain requests from reaching my web
server which is my router/firewall/web/file server. So how is a proxy suppo=
sed
to help in this case? Everyone says it is but I just don't know much about
"proxying" or proxying soloutions for that matter

Thanks alot
SBlaze


> Cheers,
>=20
> Ralf
> --=20
> Ralf Spenneberg
> RHCE, RHCX
>=20
> Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
> IPsec-Howto				     http://www.ipsec-howto.org
> Honeynet Project Mirror:                     http://honeynet.spenneberg.o=
rg


=3D=3D=3D=3D=3D
"Winky is not knowing how sir, winky is not knowing how?" -=3DWinky / Harry=
 Potter and the Goblet of Fire=3D-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

