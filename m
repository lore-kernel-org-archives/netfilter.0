From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Xtables-addons 1.6
Date: Thu, 20 Nov 2008 23:07:50 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0811202304110.25790@fbirervta.pbzchgretzou.qr>
References: <alpine.LNX.1.10.0811181840170.2316@fbirervta.pbzchgretzou.qr>  <7259d7020811181620n1ca06f84oe9d6d1f5f0a680c7@mail.gmail.com>  <alpine.LNX.1.10.0811190900450.24370@fbirervta.pbzchgretzou.qr>  <7259d7020811190732u571b90dh3d1f9938c70a1b27@mail.gmail.com>
  <alpine.LNX.1.10.0811202103120.21606@fbirervta.pbzchgretzou.qr> <7259d7020811201351q7d927070j4dc510e5a7759fcb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811201351q7d927070j4dc510e5a7759fcb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2008-11-20 22:51, JC Janos wrote:
>
>cd /usr/local/src/xtables-addons/
> commit fdb7f34bc8f8b0af0b228ba22c9cc5deec3550fc
>
>       (p.s. how do your get "v1.6-3-g85e3c24" out of git?)

	git describe <refspec>
e.g.
	git describe 85e3c24 or git describe HEAD^, whatever floats the 
boat.

>/usr/local/lib/ipset:
> -rwxr-xr-x 1 root root   14941 2008-11-20 13:28 libipset_iphash.so
> -rwxr-xr-x 1 root root   15029 2008-11-20 13:28 libipset_ipmap.so
> -rwxr-xr-x 1 root root   15370 2008-11-20 13:28 libipset_ipporthash.so
> -rwxr-xr-x 1 root root   15253 2008-11-20 13:28 libipset_ipportiphash.so
> -rwxr-xr-x 1 root root 2112524 2008-11-20 13:28 libipset_ipportnethash.so

However, this time, one of *your* libraries is excessively larger ;-)

-rw-r--r-- 1 jengelh users 21432 Nov 20 23:07 libipset_ipportnethash.oo
-rwxr-xr-x 1 jengelh users 23251 Nov 20 23:07 libipset_ipportnethash.so
