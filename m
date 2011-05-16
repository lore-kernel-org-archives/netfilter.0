From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Mon, 16 May 2011 16:41:52 +0100
Message-ID: <4DD145C0.4060705@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=k61yAf2cE1hP/xdaNe7rKGFIBjowVy1XR481SliXrss=;
        b=nvFevHr091brDlMXjT79rAvxWucNhRUSjwrzcAiimeT52V/BYo9PkISY5KacGMnxVy
         4hdn3EYG2JMKeeyi6psWPZu1sPr4Rle84TPbgkhmbkokUVZsxgwVygzB6at4kmTrUljt
         1ovgWdLgimXrTw+U8ZTDDn8dvm/VHU0oYkpmI=
In-Reply-To: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


>  - Support range for IPv4 at adding/deleting elements for hash:*net* types
>  - Set type support with multiple revisions added
>  - Fix adding ranges to hash types
>   
That's great news! Should I assume that the (more-than-double) hash bug 
I reported a while ago has also been fixed?

