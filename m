From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset-5.1 released
Date: Wed, 22 Dec 2010 12:56:07 +0000
Message-ID: <4D11F567.3020401@googlemail.com>
References: <alpine.DEB.2.00.1012221115130.3482@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ViG9U4KodXEUErOiEjkNAsF7VS0ftgmQw8KLz/zm7wQ=;
        b=J+WLRME5ajzmanFRPvCBWAsBiUOjNBUVCHAJVNJ+uP7faN6WVGQOrcFD8k4oUGrO5v
         y7wF8Nut95Nct6LbE3yxP5OImI+2UaGf+Pg/eW0HGspX6e6xDOz+dhgVDaRPWXnda9M7
         ME7bcrlMVg/+iiKRYcUhu6cSvY6JgNdakTuOM=
In-Reply-To: <alpine.DEB.2.00.1012221115130.3482@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> kernel part:
>  - Kernel version compatibility: support bumped starting from 2.6.34
>    (Supporting older kernel releases would mean too much burden for me,
>    sorry.)
>   
Does that mean the previous 5.0 (kernel?) patches need to be applied or 
is this version removing that requirement? Are the prerequisites the 
same (i.e. mnl-1.0 etc) as in 5.0?
