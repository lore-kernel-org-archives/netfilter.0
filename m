From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: installation issue with xtable addons
Date: Mon, 2 Jul 2012 12:18:11 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207021215300.15354@frira.zrqbmnf.qr>
References: <CAE1WnGc7KNZubC0qEJnpcvLkBTAbErqf2EEqEpyz0xx2rmDYvg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGc7KNZubC0qEJnpcvLkBTAbErqf2EEqEpyz0xx2rmDYvg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


On Monday 2012-07-02 08:39, rahul shrivastava wrote:
>
>what does this error mean

>checking for libxtables... no
>configure: error: Package requirements (xtables >= 1.4.5) were not met:
>
>No package 'xtables' found

You need the iptables development files installed.

>Consider adjusting the PKG_CONFIG_PATH environment variable if you
>installed software in a non-standard prefix.
>
>Alternatively, you may set the environment variables libxtables_CFLAGS
>and libxtables_LIBS to avoid the need to call pkg-config.
>See the pkg-config man page for more details.
