From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: ip6tables -S & NPT, bug ?
Date: Thu, 24 Jan 2013 20:40:45 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301242037040.27614@nerf07.vanv.qr>
References: <AB784066-DF78-45DA-9380-16E9DC8FFA7D@dilly.me>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AB784066-DF78-45DA-9380-16E9DC8FFA7D@dilly.me>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Michel DILLY <jm@dilly.me>
Cc: netfilter@vger.kernel.org

On Thursday 2013-01-24 18:15, Jean-Michel DILLY wrote:

>Hi all,
>
>I have a problem when saving my ip6tables configurations with ip6tables-save or ip6tables -S when using IPv6 NPT.
>
>root@linux:/mnt/kernel# ip6tables -t mangle -S
>-P PREROUTING ACCEPT
>-P INPUT ACCEPT
>-P FORWARD ACCEPT
>-P OUTPUT ACCEPT
>-P POSTROUTING ACCEPT
>Target `DNPT' is missing save function
>
>and then it crashes.
>
>Does anyone has this problem ?

I have sent a fix to netfilter-devel. It consists of

	7bbf65b libxtables: centralize checking for a .save function
	b485d24 extensions: eui64: set userspacesize=0
	27156df extensions: S/DNPT: add missing save function

from git://git.inai.de/iptables master.

P.S.: And hooray, the commit summary turns out not to match the content.
Oh well.
