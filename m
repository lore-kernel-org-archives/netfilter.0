From: "Fabrice Triboix" <Fabrice.Triboix@imgtec.com>
Subject: RE: How to remove TCP options when doing NAT?
Date: Thu, 28 Jun 2007 14:26:52 +0100
Message-ID: <917D8AC5A524D343B28848D8BBFFEC0701B22709@klmail1.kl.imgtec.org>
References: <1183030348.8967.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <1183030348.8967.41.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Cedric,=0D=0A=0D=0A> What were the options that were not present =5Fbefo=
re=5F the gateway =3F=0D=0A=0D=0AI have some difficulties to understand the=
 question...=0D=0AThe TCP packets coming from the local network (before the=
 gateway) do=0D=0Anot have extra options in their TCP headers. Their TCP he=
aders are 20=0D=0Abytes in size.=0D=0A=0D=0A=0D=0A> I don't know of any man=
gling extension for TCP options, like=0D=0A> IPV4OPTSSTRIP for IP options.=0D=
=0A=0D=0AI guess it is part of the NAT mechanisms... I just would like to k=
now=0D=0Awhether this is configurable or not...=0D=0AI forgot to mention th=
at I am using Linux 2.6.18, arch i686.=0D=0A=0D=0A=0D=0A> PS: pls keep the =
list Cced...=0D=0A=0D=0AYes, my mistake!!=0D=0A=0D=0A=0D=0ACheers,=0D=0A=0D=
=0A  Fabrice=0D=0A=0D=0A-=0D=0AThis message is subject to Imagination Techn=
ologies' e-mail terms: http://www.imgtec.com/e-mail.htm=0D=0A-=0D=0A

