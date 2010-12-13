From: Iain Paton <selsinork@gmail.com>
Subject: Re: aligned_{u64,be64,le64} defined in #ifdef __KERNEL__
Date: Mon, 13 Dec 2010 22:04:03 +0000
Message-ID: <4D069853.5020803@gmail.com>
References: <201008301258.33113.agruen@suse.de>	<alpine.LNX.2.01.1008301502280.19931@obet.zrqbmnf.qr>	<alpine.LNX.2.01.1010060804580.8631@obet.zrqbmnf.qr> <20101005.231045.226758916.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=+gSh/mIM41Q57BQvRMoaQWATjBXkj5eq8u/iaqrCqj0=;
        b=cKGmKweuRVcpa+sLvV9imII9uY4eP2ywmLpn9+ypXPBdI3/TTA05saxQ+BlM5bHKQ1
         68UDx55BnjZg21RpxtHZJ870tSZKWp7MyDc12EkJuZbiRT5BTTZOiOrpiCORjZWXdm72
         n73Z2yDK8zaOA61KTUynGgNAUoerEjZ5m/nGY=
In-Reply-To: <20101005.231045.226758916.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Miller <davem@davemloft.net>
Cc: jengelh@medozas.de, agruen@suse.de, netfilter@vger.kernel.org, eparis@redhat.com, linux-kernel@vger.kernel.org, schwab@redhat.com, laforge@netfilter.org, andi@firstfloor.org

David Miller wrote:
> Someone has to first add the types to linux/types.h, and that doesn't
> go through my tree.

Since the changes to linux/types.h got added in 79b5dc0c64d88cda3da23b2e22a5cec0964372ac is there any chance of the linux/if_ppp.h 
changes making it into 2.6.37 ?

Iain
