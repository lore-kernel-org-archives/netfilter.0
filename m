From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: An Interface with alias
Date: Wed, 1 Feb 2012 17:34:40 -0200
Message-ID: <CAMTjHrwsJE-FCyn6TJB+cq_+6AAvC7fcDy2Jpgc4cOJ8grYmdg@mail.gmail.com>
References: <CAMTjHryLg65vvLBJUsDGsNt82P0iXQmFihV_8UTn=Pm8OzG0Dg@mail.gmail.com>
	<1328123283.1891.16.camel@andy-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1328123283.1891.16.camel@andy-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thank you Andy,

Why not just use multiple physical network interfaces?

because shortage of interfaces physical.





Em 1 de fevereiro de 2012 17:08, Andrew Beverley <andy@andybev.com> esc=
reveu:
> On Fri, 2012-01-20 at 15:46 -0200, Usu=E1rio do Sistema wrote:
>> so... I wonder if is very bad or what can happen when I do alias on =
a
>> interface for more the one network. for exemplo:
> ...
>> I wish drop any packages between theses network. any traffic between
>> the network 172.16.30.0/30 and 172.16.30.4/30 must dropped by
>> iptables.
>
> That sounds a bit messy, and I don't even know if it's possible. Why =
not
> just use multiple physical network interfaces?
>
> Even if you got it working, if the computers on the 2 separate networ=
ks
> had their netmask incorrectly configured, then you'd get traffic pass=
ing
> directly between them without even going to the Linux box.
>
> Andy
>
>
