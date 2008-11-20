From: Mike <mikef1007@gmail.com>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 10:35:28 -0800
Message-ID: <d006ee070811201035r5353a2b9r6fb6cff8deb159bd@mail.gmail.com>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
	 <20081120122753.606233a2@nacelle.mxtelecom.com>
	 <d006ee070811201000k7684ffaah4851e687dc3942d4@mail.gmail.com>
	 <20081120180728.23e681bf@nacelle.mxtelecom.com>
	 <d006ee070811201024x23f6fa88l20edfab22ef20e2f@mail.gmail.com>
	 <20081120182928.61c9d749@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=IIV5sIVd5+50ux5u4rjxRF4RRY8XedzAMLDyGHh9ZrQ=;
        b=ZM9hlhY1/OjvNmVP8Nt8/+fbC/fHGyL5LbZmrmxr7/MTibKPxTmQTjzj+Y9C8yZ++t
         YUrTzieSMkN/bFsWYRdiHfke36meTdmMQnal4xYrFcBEK4DZr0BF4MotbAQA0Z4A5paB
         YfM7ZZafLAkZB21t3bfovS02sUnUdifbKXg8g=
In-Reply-To: <20081120182928.61c9d749@nacelle.mxtelecom.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Evans <paul@mxtelecom.com>
Cc: netfilter@vger.kernel.org

> The "nat" table only applies to packets that conntrack believes are
> NEW. I.e. TCP SYN packets, or UDP/ICMP for which it doesn't yet have an
> entry. As soon as the TCP session is established, nat isn't used any
> more and conntrack takes over.
>
> If you keep one existing TCP connection open, that will continue to
> have the nat rules applied that were in place when it was established,
> regardless of the current ruleset in iptables.
>

Forgot to include in prev email,  I did  disconnect, then re-initiated
a connection.
Traffic still appeared on my redirect to port.
even sent 'tcp packet' which showed up in my redirect to port.
