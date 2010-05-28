From: Ashok Rao <greatarbor@gmail.com>
Subject: Re: openwrt Atheros ar71xxx based router reboots with RAWDNAT, 
	RAWSNAT
Date: Fri, 28 May 2010 11:19:24 -0400
Message-ID: <AANLkTil5j_AA2gGBkhnolVwpXbnzkQ4xzxX0GzTERNin@mail.gmail.com>
References: <AANLkTimCBl0ADwbcVsW1wVSeDuXMF0Rd2lNLeTks-DxC@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=ZgYgJ4ivX1zOzdc/H6nthuFURh1LOiKKmHwFJBFaC0E=;
        b=U1s9xC377PZPPnr/Qw19t0kzQiyHSgLu9qWITniJIU0aSx+fORw0ggJkstoBtwMqg9
         PONmEmBQYu9ACotHDkexlmY0fapdNSAY0m3EgQep9PVRvFERD8CazQ26AV9ZNg0NA6nZ
         T6sF4CPRJ573J7C54CS/DQRWtzfjIcLhnac3w=
In-Reply-To: <AANLkTimCBl0ADwbcVsW1wVSeDuXMF0Rd2lNLeTks-DxC@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Mon, May 24, 2010 at 9:09 PM, Ashok Rao <greatarbor@gmail.com> wrote=
:
>
> I have to open up the router and break the warranty =A0to install a
> serial console cable and haven't done that yet. In the meantime, if
> anyone has a clue please =A0post
>
> Ashok
>
Installed a serial cable however the kernel OOPs message was not
particularly informative (something relating to an invalid memory
access -  which I should have captured but did not ). I then
recompiled the kernel with a number of debug options. With the new
kernel, however, the router does not reboot. I'm going to go back and
keep only the minimal number of debug options. Can any of netfilter
gurus give me some pointers on what KERNEL debug options might be
sufficient. ?
Here's what I've enabled so far

#
# Kernel hacking
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy

CONFIG_ENABLE_WARN_DEPRECATED=3Dy
CONFIG_FRAME_WARN=3D1024
CONFIG_STRIP_ASM_SYMS=3Dy
CONFIG_DEBUG_FS=3Dy
CONFIG_DEBUG_KERNEL=3Dy
CONFIG_DEBUG_SHIRQ=3Dy
CONFIG_DEBUG_OBJECTS=3Dy
CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
CONFIG_DEBUG_OBJECTS_FREE=3Dy
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D0
CONFIG_DEBUG_KOBJECT=3Dy
CONFIG_DEBUG_INFO=3Dy
CONFIG_DEBUG_VM=3Dy
CONFIG_DEBUG_WRITECOUNT=3Dy
CONFIG_DEBUG_MEMORY_INIT=3Dy
