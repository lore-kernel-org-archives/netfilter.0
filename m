From: Andrew Beverley <andy@andybev.com>
Subject: Re: Problem with log which are corrupted and need help with
 hitcount and FORWARD rules
Date: Sat, 22 Oct 2011 16:27:30 +0100
Message-ID: <1319297250.26402.6316.camel@andybev-desktop>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
	 <1319289600.26402.6260.camel@andybev-desktop>
	 <CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
	 <1319293517.26402.6312.camel@andybev-desktop>
	 <CACMGiwaJ69TsOb6gVH_GXLk09yKhxqLExa_s-NXhG8d9M2z7hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319297249;
	bh=Egu4F1Hl/VrwxS4WgG8++202j9dEH8zP0G6f1yRUrWY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=VpdrOp4fzjIIAmQ7QOnuYQbzsMA0KXb9//J5xSvTLSmg2ErHmA9zPVHXOHipUqZ2B
	 OFxWLRrNB5E/ptaVlQqQw+7DKWZ4uN77QmAwvEC3vdCje3WXiZwCjA4h3FtV+chshf
	 fICeNZZFVnfKw22VLPrTNp1+r20nb2t9nahAsYLw=
In-Reply-To: <CACMGiwaJ69TsOb6gVH_GXLk09yKhxqLExa_s-NXhG8d9M2z7hQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Azerty Ytreza <007liamg007@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-10-22 at 17:11 +0200, Azerty Ytreza wrote:
> Just mean gateway/firewall server that all the traffic passes through.
> 
> No doesn't work ... The port is blocked when I try these rules (copy
> of the INPUT rules) :
> 
> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> NEW -m recent --set
> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> NEW -m recent --update --seconds 600 --hitcount 1 -j DROP

You've got a hitcount of 1. Don't you mean 10 as you had in your first
set of rules?

> And sorry but I have never user mailing list. I don't known how it's
> work exactly :(

No problem, but please don't put your reply at the top. Put it either
within or at the bottom of the quoted email, just like I have for this
email. It makes it easier for other people to follow the conversation if
they've joined late or are reading it in the archives :)

Andy


