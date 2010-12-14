From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: UDP MSS
Date: Tue, 14 Dec 2010 19:48:23 +0530
Message-ID: <AANLkTi=DVeXDZDdj30qSuCurCVyq-Lf+mukAVA1yCgfx@mail.gmail.com>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>
	<alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr>
	<AANLkTi=c1eBB669nmXiTGOOUzrDQWLc3mvw2qWuw8_Cv@mail.gmail.com>
	<4D076157.7050508@oracle.com>
	<AANLkTikpqV2aHDGdm8GtYLdapupTdjFiH9nHZT6T9Rbf@mail.gmail.com>
	<alpine.LNX.2.01.1012141444540.24260@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=e7Y/H/9Q+ZSHsLTsFXdhAjS5FfdNyYsNTaID/LtGjM0=;
        b=xBWB5eTvMtiCHwUEm9SeV0T+DRsmS/Z4Y+ewYRjcpdZUkYZtj01xvC2t0C0ZzG9XaH
         4lTqlzrqeP0vsNHQfgOwRRfYDP1gVyy1JqC4FgPIv4QrskdziR3wewIMWIsUhMUPkFCW
         S0IKykw0wqlDXU4Q4bx92Qxuyb0D837NQjvm4=
In-Reply-To: <alpine.LNX.2.01.1012141444540.24260@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: John Haxby <john.haxby@oracle.com>, Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, Dec 14, 2010 at 7:15 PM, Jan Engelhardt <jengelh@medozas.de> wrote:

> Fragmentation is always done by the IP layer, even with
> protocols like TCP.
> You must mix up fragmentation and segmentation.

Jan,

  what will be normal size of udp  segments ?

-Ratheesh
