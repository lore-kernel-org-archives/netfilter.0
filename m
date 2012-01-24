From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [xtables-addons] problem with TEE and Debian Lenny (Unknown arg
 (null))
Date: Tue, 24 Jan 2012 22:25:57 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201242220140.5731@frira.zrqbmnf.qr>
References: <CAPJYFP-XLLoupqx9t9+C98S887Hr7yDe-oZ0--2fHOcFzOM1hg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPJYFP-XLLoupqx9t9+C98S887Hr7yDe-oZ0--2fHOcFzOM1hg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksey Kashin <aleksey.kashin@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-01-24 18:24, Aleksey Kashin wrote:

>Hello.
>
>I'm using Debian Lenny amd64. I need clone traffic to another server.
>I'm trying to use TEE module from xtables-addons, but I've got this
>error:
># modprobe xt_TEE
># iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.99.2.37
>iptables v1.4.2: Unknown arg `(null)'
>Try `iptables -h' or 'iptables --help' for more information.
>
>What does it mean? Can anyone help me with this problem?
>
>I use the following software:
>- Debian Lenny amd64 5.0.8 with 2.6.26-2-vserver-amd64 kernel
>- iptables - 1.4.2-6
>- xtables-addons-common - 1.26-2
>- xtables-addons-modules-2.6.26-2-vserver-amd64 - 1.26-2+2.6.26-27

As per the INSTALL file of xt-a, version 1.26 requires iptables 1.4.3. 
This dependency is probably not properly recorded in the 
xtables-addons-common-1.26-2 package, but starting with iptables 
1.4.12.2, the deps are properly propagated to xt-a.
