From: Denys Fedoryshchenko <denys@visp.net.lb>
Subject: Re: ipset, =?UTF-8?Q?IP=36=5FNF=5FIPTABLES?=
Date: Tue, 17 May 2011 16:18:12 +0300
Message-ID: <15a9871d63995059f1eedb259f504787@visp.net.lb>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb>
 <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu>
 <4DD256F7.7050007@googlemail.com>
 <fbc9abc624824c8e6f973c342e81fe51@visp.net.lb>
 <4DD27254.1090706@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD27254.1090706@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ed W <lists@wildgooses.com>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

 On Tue, 17 May 2011 14:04:20 +0100, Ed W wrote:
> On 17/05/2011 12:14, Denys Fedoryshchenko wrote:
>> Especially it is a problem for source based distributions, like 
>> gentoo,
>
>

>
> Just add USE="+ipv6" to your make.conf, "emerge --newuse -uvDkp 
> world"
> and off you go...
 In my case it is sometimes specific embedded application, and few kbyte 
 matter. IPv6 is no go there.
