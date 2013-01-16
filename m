From: Manuel Scheub <manuel.scheub@kraftcom.de>
Subject: Re: iptables deactivate "getportbyname"
Date: Wed, 16 Jan 2013 11:52:15 +0100
Message-ID: <50F6865F.9000709@kraftcom.de>
References: <50F5483C.9050807@kraftcom.de> <alpine.LNX.2.01.1301151350060.19279@nerf07.vanv.qr> <50F56710.30600@kraftcom.de> <alpine.LNX.2.01.1301151534340.20597@nerf07.vanv.qr> <50F57C59.9050607@kraftcom.de> <alpine.LNX.2.01.1301151920100.5425@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301151920100.5425@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

Am 15.01.2013 19:22, schrieb Jan Engelhardt:
> On Tuesday 2013-01-15 16:57, Manuel Scheub wrote:
>
>>>>>> #iptables -A INPUT -p udp -i eth0 --dport 67 --sport 68 -j ACCEPT
>>>>>> iptables v1.4.16.3: Port "67" does not resolve to anything.
>> # /lib/libc.so.6
>> GNU C Library stable release version 2.3.2
> Fixed and posted a 2-patch fix on netfilter-devel:
>
> ==
> The following changes since commit 983196ceb4d3bb7b6d3cf6da18bb6d5a5eafb347:
>
>    doc: document the -4 and -6 options (2013-01-07 02:26:16 +0100)
>
> are available in the git repository at:
>
>    git://git.inai.de/iptables old-linux
>
> for you to fetch changes up to 1071ec54e6d7af406fe34afea1ce2c3e49ee1914:
>
>    parser: workaround glibc-2.3.2 bug 358 (2013-01-15 19:16:55 +0100)
>
> ----------------------------------------------------------------
> Jan Engelhardt (2):
>        build: fix libiptc build failure on old linux-glibc-devel headers
>        parser: workaround glibc-2.3.2 bug 358
>
>   libiptc/linux_list.h   |    4 ++--
>   libiptc/linux_stddef.h |    4 ++--
>   libxtables/xtoptions.c |   14 ++++++++++++++
>   3 files changed, 18 insertions(+), 4 deletions(-)

Awesome - Thank you very much!

