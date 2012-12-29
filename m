From: Born Without <blackhole@airpost.net>
Subject: Re: osf match, --ttl & --log options missing in iptables[-save] [-[L|S]]
Date: Sat, 29 Dec 2012 09:12:39 +0100
Message-ID: <50DEA5F7.6060806@airpost.net>
References: <50DBE9C9.8090500@airpost.net> <50DEA514.4050006@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
	 bh=6SSzEDTIu3WFPKqyrIcDwhW7lNk=; b=ZsbvFIGiiPDUASgoXsLThKGmSmxf
	9JhDdBGrjOSFsLVTOqY6muWRoU2leaZwXOSPOFD8uDi+B2MI6YAUPKfbNCwY+Nkx
	eH45FwDnblYElDAL+GFkBhrDRGRRJWIfD/rRfiiXUgN7nu4T/umt0g3M75nbOgnd
	TdcPIvKSH+VH/w4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=6SSzEDTIu3WFPKqyrIcDwh
	W7lNk=; b=Juq5VrBGwxCoGYK9NXbu+3pDe87Elon3kOAMzez6BWcirMy7OKHLZM
	urPvhC+UZ4OS5w+8zAjkNO2uOCB9WDZWdjYk3D2x9rAs6KoC+AVH4pkWX4Q4RTRj
	F1hnDZlC2v+DrJq3UlnO/p93FMgkUa52KWr+FMz9hQBsbD6HcVWxI=
In-Reply-To: <50DEA514.4050006@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 29.12.2012 09:08, Born Without wrote:
[...]

> $IPTABLES -A PROBERS -p tcp -m osf --genre Windows --ttl 1 -j SET
> --add-set windows_probers src
> $IPTABLES -A PROBERS -p tcp -m osf --genre Windows --ttl 1 -j SET
> --add-set windows_probers src

copy and paste error, that this rule is listed twice - sorry :/

[...]
