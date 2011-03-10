From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to completely disable conntrack?
Date: Thu, 10 Mar 2011 23:47:07 +0100
Message-ID: <4D7954EB.1050704@plouf.fr.eu.org>
References: <4D7785DC.8050904@centrum.cz> <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pandu Poluan <pandu@poluan.info>
Cc: =?ISO-8859-15?Q?Petr_=A6t=28astn=FD?= <petr.stastny@centrum.cz>, netfilter@vger.kernel.org

Hello,

Pandu Poluan a =E9crit :
> I'm sure there's a sysctl knob, but off the top of my head:
>=20
> -t raw -A PREROUTING -j NOTRACK

You'll need the same in the OUTPUT chain too.

> On 2011-03-09, Petr =A6t(astn=FD <petr.stastny@centrum.cz> wrote:
>> I'm using Fedora 14, which has conntrack compiled into the kernel. I=
t is
>> not a module, so I'm not able to unload it to disable connection
>> tracking. Is it possible to do it in another way without building my=
 own
>> kernel?

