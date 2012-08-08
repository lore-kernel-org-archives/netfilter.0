From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Security validity of iptables in multi bridge environment.
Date: Wed, 8 Aug 2012 19:39:55 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208081935480.4516@frira.zrqbmnf.qr>
References: <5022A17F.9030701@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5022A17F.9030701@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Middleton <stewart.middleton.spam@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2012-08-08 19:27, Stewart Middleton wrote:
> http://publib.boulder.ibm.com/infocenter/lnxinfo/v3r0m0/topic/liaat/liaatkvmsecnetfilter.htm
> """Netfilter, although allowing the use of iptables to create layer 3
> filtering rules, is also seen as a security risk for guest isolation because
> Netfilter processing sometimes occurs on a global context (without
> distinction of a source layer 2 port). """
>
> So i would be interested in any advice in terms of:
>
> 1) Is the IBM info outdated?

Yes it is. -j CT --zone  and  -m physdev  should be used
to resolve the "problem".
