From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: packets skipping dnat rule and someting else
Date: Sat, 24 Sep 2011 19:23:10 +0400
Message-ID: <647511316877790@web18.yandex.ru>
References: <4E7DE255.1070805@xmsnet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1316877790; bh=RORx9zVF7XDarIbpSvBBE3rv3TRfA8m/DqPwnQyS9UE=;
	h=From:To:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=n6hgbLBrvPjDw523VPXw6YFLR3lKEKvIlH17bHwmDYi75h7QKyjiXZ93V0bl02ceD
	 Gt6r6UPBdu97a7e5LJs69ImTxqZr36OdIxqgaISST8RVRgsexom0duvklAYl5cM3gV
	 G9GxmKs+VFx1LxgOK0Tp3eJUjOCT6fDB9sq61xjM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1316877790; bh=RORx9zVF7XDarIbpSvBBE3rv3TRfA8m/DqPwnQyS9UE=;
	h=From:To:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=n6hgbLBrvPjDw523VPXw6YFLR3lKEKvIlH17bHwmDYi75h7QKyjiXZ93V0bl02ceD
	 Gt6r6UPBdu97a7e5LJs69ImTxqZr36OdIxqgaISST8RVRgsexom0duvklAYl5cM3gV
	 G9GxmKs+VFx1LxgOK0Tp3eJUjOCT6fDB9sq61xjM=
In-Reply-To: <4E7DE255.1070805@xmsnet.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans de Bruin <jmdebruin@xmsnet.nl>, netfilter@vger.kernel.org



24.09.2011, 17:59, "Hans de Bruin" <jmdebruin@xmsnet.nl>:

> [22734.688709] CHAINv4=in_int IN=eth3 OUT=
> MAC=00:30:18:a6:c0:f2:00:0e:00:00:00:01:08:00 SRC=186.207.156.227
> DST=92.254.124.152 LEN=40 TOS=0x00 PREC=0x00 TTL=112 ID=27025 DF
> PROTO=TCP SPT=62434 DPT=16881 WINDOW=0 RES=0x00 RST URGP=0

This packet doesn't belong to any valid connection from conntrack point of
view. Maybe this RST is duplicated and conntrack entry was destroyed a
moment before.

You can use -m conntrack --ctstate INVALID to catch such packets.

-- 
wbr, Oleg.
