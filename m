From: Payam Chychi <pchychi@gmail.com>
Subject: Re: Bizarre NAT behavior
Date: Thu, 23 Jun 2011 10:00:38 -0700
Message-ID: <BANLkTinoDyYksg01LfN7W2NBXZnm3+B78g@mail.gmail.com>
References: <925A849792280C4E80C5461017A4B8A2A03FEB@mail733.InfraSupportEtc.com>
	<925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com>
	<925A849792280C4E80C5461017A4B8A2A04055@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type;
        bh=fI4BMfmosAkvfwL1v3uXMOuvj5VKhLdid8Sb8Bsu1bQ=;
        b=nzVqo3zj7PlxR9f19jfcm20aF0oUtCWluUGy5X7GYA5aCNN8I2KWeIbY+UFRnXWNwk
         KLy3O36s0oNrcp2uAJK7Ekf7MLVG557LpMO/1JTrnfXJPZy7qExq3GCKKXnbeDyVq9fd
         BT7HfGPHPDEacevLZGqRQ1cih4iCXf77tqC5I=
In-Reply-To: <925A849792280C4E80C5461017A4B8A2A04055@mail733.InfraSupportEtc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Scott <GregScott@infrasupport.com>, netfilter@vger.kernel.org

Why are u not natting to internal ip space? Better question, if ur
using NAT why are you not using internal ip inside ur network and
natting to external ip on the egress? Just trying to see why you've
chosen this topology over others.



On 6/23/11, Greg Scott <GregScott@infrasupport.com> wrote:
>> Why would NATing in both PREROUTING and POSTROUTING
>> work  **only**  when I watch it with tcpdump and not work otherwise?
>
> I should be more clear.  The problem is with internal users looking at
> internally hosted web and ftp sites using the public IP Addresses.  The
> way you do this is, DNAT the packet in PREROUTING and then MASQUERADE
> the packet in POSTROUTING.  The technique is documented in a howto
> someplace and I've been doing it for several years at several sites.
>
> At this particular site, all worked fine until I replaced the old
> firewall with a new one.  Now it only works properly when I watch the
> conversation the tcpdump.  I'm not making this up.
>
> - Greg Scott
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Sent from my mobile device

Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer
