From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset maximal/minimal revision conflict
Date: Tue, 26 Apr 2011 16:06:14 +0100
Message-ID: <4DB6DF66.6040009@googlemail.com>
References: <4DB6A9A5.5070301@googlemail.com> <alpine.DEB.2.00.1104261558430.1834@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=fPTEMPHQB7DrMP3lTCot4BfIltTY6n29Xv0nIIP7qc0=;
        b=f+Xb89hR0PwUjbCBvgp5G7FgBXJREFfrkpCH0GmOui+7ZQ2odfQNsmsbjrIIzSXF2y
         bTZ9c1hhH4hIrQBeQMfFc2dTU+Fp8HRjwXlXYMvExZszGxJvVOodcMswp1XOl0xwgjNr
         Vt+1g4zQCXRv96eiOXy8MtHhD0zlWS26sKINo=
In-Reply-To: <alpine.DEB.2.00.1104261558430.1834@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> The hash:*port* types have got a new revision due to the introduced SCTP 
> and UDPLITE support. The ipset package contains the matching kernel 
> modules, the kernel tree is a little bit behind.
>   
I see, the ipset files in the kernel version and the kernel files in the 
ipset package are out of sync then, right?

Would I be able to successfully split this up by using the source files 
in the kernel/ directory of the ipset 6.4 package and move them over to 
the ipset kernel source directory, whilst keeping all the 
make/configuration files in the ipset kernel directory (Kbuild and 
alike) intact?

Would that solve the above problem (keeping/building the ipset package 
as a whole is *not* an option for me, before you ask)? I also assume 
that the kernel files in the ipset package are newer as the above error 
suggests, right?

