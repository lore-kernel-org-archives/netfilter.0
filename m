From: Steve Brown <sbrown25@gmail.com>
Subject: Re: Poor upload speed with NAT
Date: Tue, 11 Aug 2009 09:22:17 -0500
Message-ID: <1f4ef0970908110722i41e934bcm48b2ba0d66587dcf@mail.gmail.com>
References: <1f4ef0970908101443i28bf4c1hc6b280d4096fd100@mail.gmail.com>
	 <6808368f3857f867cd0735df99bacdd8@mail.treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=1reIRaILu6FWfSlns9O1JLo95qtCybMTVQtg3Da1TAQ=;
        b=TvRdWLE2TL0BWd4e6rqbFd2ox5R3LV99mUIYuaEMudonpBRTbJ6kyJJ5E0NpO50PjR
         0mpI1JkdE1GPwnskhHYkzlGjH6xv5YEK5D3lf7kUZtRIhXgawTITTGErNiZPQwGz/A52
         x7IsZzPIQnhWlzuwL2S5Ab5nCVwj7CY0AHpR0=
In-Reply-To: <6808368f3857f867cd0735df99bacdd8@mail.treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> I always *NAT in PREROUTING and MASQUERADE in POSTROUTING if needed.

According to the manpage for iptables, SNAT is only valid in the
POSTROUTING chain.  Is this incorrect?

> Have never seen any such performance drop on multiple NIC.

Neither have I, which is why this is bothering me.
