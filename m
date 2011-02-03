From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset-6.0 released
Date: Thu, 03 Feb 2011 17:07:02 +0000
Message-ID: <4D4AE0B6.6040108@googlemail.com>
References: <alpine.DEB.2.00.1102031353130.31387@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=GGUusX5paxU9SNFJ7bIYbYdV284D9B2HAMj+Jz2LdZY=;
        b=VoztdQvIMkZKoWloTKxIDnmu1NOuET4qcHzHSYSijxD34Y6DYlcnVg4bJLrfxMClJe
         wl2gHdSHU063X/NCmuOBK25EcoM+FTc4+va5/QO6q9ceuV2UOEYlsLb44by9QPqcrT1T
         atdQ0eF0z3avvxNDnuziH80siMO3Bxm5jUK10=
In-Reply-To: <alpine.DEB.2.00.1102031353130.31387@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> I'm happy to announce ipset 6.0, a new milestone of the tool. Here follows 
> the list of the changes since the previous release:
>   
I do have a couple of queries - I take it this version includes all the 
patches you posted in this mailing list (which were duly ACKed) in the 
previous couple of weeks, right? If so does that mean all kernel-related 
modules are now excluded from this release or do I have to compile/build 
them as was the case with all previous ipset versions?

The reason for asking this is simple - as it stands, I am building the 
kernel modules separately from the userspace tool (using two separate 
.spec files - in a similar fashion as it is done with the 
xtables-addons), but would like to incorporate your kernel modules as 
part of building the kernel and use just one spec file for building the 
userspace tool without the need to do anything else.

