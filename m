From: Abhijit Pawar <abhi.c.pawar@gmail.com>
Subject: Re: [PATCH RESEND] net: remove obsolete simple_strto<foo>
Date: Tue, 11 Dec 2012 09:03:41 +0530
Message-ID: <50C6A995.1020908@gmail.com>
References: <1355130748-7828-1-git-send-email-abhi.c.pawar@gmail.com> <20121210.141002.450030380391247897.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=EwCM4XPsAdCgv7x+5TnX/aPgGAs3stpUaxrdA3Ljreo=;
        b=y2T0esAB7oOyBUjnSbQ9IO3M5HDwDWpQCobZwXFu2eAccS1aZlYpHsYrS27FAQ5KDD
         G3tA06NuDwyf6r7V5VFqad4m/0DP1y1PfnP/ICw4IsZ615szBopTc8sUX8XVFy2LFRZj
         7WOcEFWmnKDtRqoRl4J2ZKB4kTaAAa84q4jQj/RvkJcrjwgLh3ErWokWmDrBqUYJWFrg
         wL55THo2Ro42lmL96svbDX7JjawynMzHZ8nwNx/8YfbuAo+uftSzRM88qOfNMIu8wl0x
         Swyu+98DwSSFKabh4jk3btFN6H6hbTw0k5NnNELsRhWMvvkgw5+YdxxG2ad2TT42SYG+
         nYHg==
In-Reply-To: <20121210.141002.450030380391247897.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: abhi.c.pawar@gmail.com, pablo@netfilter.org, kaber@trash.net, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, linville@tuxdriver.com, johannes@sipsolutions.net, amwang@redhat.com, edumazet@google.com, nhorman@tuxdriver.com, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-wireless@vger.kernel.org

On 12/11/2012 12:40 AM, David Miller wrote:
> From: Abhijit Pawar <abhi.c.pawar@gmail.com>
> Date: Mon, 10 Dec 2012 14:42:28 +0530
> 
>> This patch replace the obsolete simple_strto<foo> with kstrto<foo>
>>
>> Signed-off-by: Abhijit Pawar <abhi.c.pawar@gmail.com>
> 
> Applied.
> 
Hi David,
It seems that there are occurences of simple_strto* still present in the
couple of files which are not yet removed correctly by this patch. I
will send a modified patch shortly. Please revert this commit and use
the newly sent patch to merge with the tree.

-- 
-
Abhijit
