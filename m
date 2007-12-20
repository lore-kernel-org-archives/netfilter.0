From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: iptables - Couldn't load target error
Date: Thu, 20 Dec 2007 10:03:26 +0000
Message-ID: <200712201003.26454.vda.linux@googlemail.com>
References: <200712191221.58597.schane@osmozis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date:user-agent:cc:references:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
        bh=Ud3jPT3OL6vxQBVjUMCh3Um6oI4SgUQGlLjjipbLlOo=;
        b=X7reGvLoBGuW5xFjpgbTVMC1cctc4HYZgYuioFIC7I1yvRWyBQq7cQFnpHUpMzS2/wgKj5WG9t26jXjoYlER+tIva7qlXyfQ2vSpm7T/6D4wYjmjyDKRJwvpQK2S93CFWAKYWFNwyFGsiRW4Pg8/1wJWxDDKkmG/T3vwvxzlV9Q=
In-Reply-To: <200712191221.58597.schane@osmozis.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: busybox@busybox.net
Cc: Saravanan Chanemouganandam <schane@osmozis.com>, netfilter@vger.kernel.org, linux-arm@lists.arm.linux.org.uk

On Wednesday 19 December 2007 11:21, Saravanan Chanemouganandam wrote:
> Hi all,
>
> I have some problem with iptables (v1.3.8) and extension supports libraries
> installed to the buildroot's root filesystem (/lib/iptables) running on
> Xscale pxa270.
>
> iptables with MASQUERADE support throws Couldn't load target error. The
> following strace shows that it tries to open libraries in the /lib and in
> the /usr/lib instead of /lib/iptables.

Last time I built iptables from source it was iptables-1.3.5.
iptables are not using de-facto standard "configure+make"
install process, they take make variables instead.

Mine was built with:

# Do NOT point it to non-pristine kernel tree!
# (seen horrible miscompilation on 32:64 user:kernel x86_64)
KERNEL_DIR=/usr/src/kernel/delay/linux-2.6.17.11.src

make KERNEL_DIR="$KERNEL_DIR" BINDIR=... LIBDIR=... MANDIR=...

I guess you built your iptables with wrong/unset LIBDIR.

People were right pointing out that this is not busybox related question.
--
vda
