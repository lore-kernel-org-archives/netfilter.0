From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sun, 03 Oct 2010 23:04:17 +0100
Message-ID: <4CA8FDE1.8090809@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu> <4CA7978B.9020900@googlemail.com> <alpine.DEB.2.00.1010032106460.26617@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=DOsmNWSJs7dyIsKI1UffDYDkpsDS+DJkKLkTWtjySIw=;
        b=ea8wrltddhLb1MLFZOe5Zi6kKWntQMMmyDaYEN32l6khWQKsMSI4jqlm6IxAA3y2Uh
         P8Md+lwN3G4WpIzwz19a8siFSSJijhUngtf3v6Z8sLwAszMDT4e6KhPClFOVbReRIw2O
         zjsI3+J/tYjE/keoJAQdWzTCPf58dlfjpCQLs=
In-Reply-To: <alpine.DEB.2.00.1010032106460.26617@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> IP_NF_SET_MAX is honored. Run "make ... V=1" and you see that the value is 
> passed to CONFIG_IP_NF_SET_MAX which is used up directly in 
> kernel/ip_set.c. However, IP_NF_SET_HASHSIZE is forgotten and not 
> referenced in the userspace code, so setting the default hashsize at 
> compiling time does not work yet.
>   
So I should not use IP_NF_SET_HASHSIZE for the time being until it is 
fixed, right?

