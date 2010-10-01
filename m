From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Fri, 1 Oct 2010 23:05:47 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA5C48E.9010603@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Fri, 1 Oct 2010, Mr Dash Four wrote:

> > You should provide at least the following: kernel, iptables, ipset version
> > numbers, the iptables rules and the (non)matching sets with the elements.
> > Without exact details I cannot help.
> >   
> kernel-2.6.34.7-56.fc13.x86_64
> iptables-1.4.7-2.fc13.x86_64
> ipset 4.3
> xtables-addons 1.29
> 
> For the purpose of this small test, I am initiating a connection from the
> local machine (10.1.2.7, network 10.1.2.0/24) to my other machine (10.1.1.3,
> network 10.1.1.0/24) over ssh (port 22) and ask iptables to match that and log
> it to the syslog.
[...]

Thanks for the complete description - I have just released ipset 4.4 which 
fixes this nasty bug.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
