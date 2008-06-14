From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: patch-o-matic and recent kernel/iptables
Date: Sat, 14 Jun 2008 19:09:36 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806141906040.23098@fbirervta.pbzchgretzou.qr>
References: <4853E82F.8080807@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4853E82F.8080807@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>


On Saturday 2008-06-14 17:47, Leonardo Rodrigues Magalh=C3=A3es wrote:
>   Hello Guys,
>
>   I've download latest iptables (1.4.1) and latest kernel (2.6.25.6).=
 I've
> download also latest available patch-o-matic-ng snapshot, dated 20080=
521.
>
>   Unfortunelly i cannot apply POM patches over this iptables/kernel
> combination. Always i got is:

Consider patch-o-matic dead. A few projects that need direct patching,
such as xt_ACCOUNT and xt_layer7 provide perfect patches that make
runme unnecessary, and other extensions are available in Xtables-addons
which does not require any patching but builds as modules.

>   Question ..... is there any place where i can grab most recent POM =
or that
> project is really frozen ? is there anyway of applying POM patches ov=
er this
> kernel/iptables combination ?

http://freshmeat.net/p/xtables-addons/
