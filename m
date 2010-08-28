From: Brian Schang <netfilter@lists.schang.net>
Subject: Re: Problems compiling xtables-addons v1.28
Date: Sat, 28 Aug 2010 08:23:26 -0400
Message-ID: <4C78FFBE.1030601@lists.schang.net>
References: <4C7883B1.10006@lists.schang.net> <alpine.LNX.2.01.1008281356110.16282@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1008281356110.16282@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan:

On 8/28/2010 7:57 AM, Jan Engelhardt wrote:
> On Saturday 2010-08-28 05:34, Brian Schang wrote:

>> I have successfully compiled and am running xtables-addons v1.27. However I
>> cannot get v1.28 to compile:

> It seems I made use of a feature without updating configure.ac
> accordingly. This is the new patch just commited.
>
> commit f9922c6f85a1c46c210271495e8b50b180ef71e2
> Author: Jan Engelhardt
> Date:   Sat Aug 28 13:56:12 2010 +0200
>
>      configure: pkglibexecdir requires automake>= 1.10.2
>
> diff --git a/configure.ac b/configure.ac
> index 9c02436..89793d0 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -3,7 +3,7 @@ AC_INIT([xtables-addons], [1.28])
>   AC_CONFIG_HEADERS([config.h])
>   AC_CONFIG_MACRO_DIR([m4])
>   AC_PROG_INSTALL
> -AM_INIT_AUTOMAKE([1.10 -Wall foreign subdir-objects])
> +AM_INIT_AUTOMAKE([1.10.2 -Wall foreign subdir-objects])
>   AC_PROG_CC
>   AM_PROG_CC_C_O
>   AC_DISABLE_STATIC

Everything seems to work now. Thank you very much for the help.

-- 
Brian Schang
