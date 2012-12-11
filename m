From: Abhijit Pawar <abhi.c.pawar@gmail.com>
Subject: Re: [PATCH RESEND RESEND] net: remove obsolete simple_strto<foo>
Date: Tue, 11 Dec 2012 10:59:53 +0530
Message-ID: <50C6C4D1.6070607@gmail.com>
References: <1355196860-10708-1-git-send-email-abhi.c.pawar@gmail.com> <20121210.234923.94776338088489257.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=vhx7SNilSF/JO+AjAGcVEuXCrdRGa2mRHVodUJple10=;
        b=mftprT/t2PV6zPwyY6WI5Kmb8oo7PHxdp+jz6NXT7DNBCuBn89nCUREenHEqzstJs+
         lW/gXcCvN+sCNppxNVkHs+8t4uB2C4zCBMEIG8EZZiZYSlKhXhEf8lB59dpjifT26ObU
         xVx/MpzRS9pyqvB+r2HYZRNtSBTAQfVgbB+lOMUwEOwTNNjn6osvoUsXQzP5URzAeX5v
         BB7aeCJqNlZIu6EI9/AImZ3ZddqI0CFyo1vKLH/X2ocwgDGD0xdt6F9LbM5dQ4rMwTiZ
         zuMv3XuVXxt40LJ74/Krhg3waitb0hEBTW2TzoKuoXUaXSyCt+v9UuTdF067x+OtFdrL
         0soA==
In-Reply-To: <20121210.234923.94776338088489257.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: abhi.c.pawar@gmail.com, pablo@netfilter.org, kaber@trash.net, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, linville@tuxdriver.com, johannes@sipsolutions.net, amwang@redhat.com, edumazet@google.com, nhorman@tuxdriver.com, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-wireless@vger.kernel.org

On 12/11/2012 10:19 AM, David Miller wrote:
> From: Abhijit Pawar <abhi.c.pawar@gmail.com>
> Date: Tue, 11 Dec 2012 09:04:20 +0530
> 
>> This patch replace the obsolete simple_strto<foo> with kstrto<foo>
>>
>> Signed-off-by: Abhijit Pawar <abhi.c.pawar@gmail.com>
> 
> You can't submit replacement patches for ones which I have already
> applied.
> 
> Patches I apply are permanently applied, and therefore you must submit
> changes relative the ones I've applied already.
> 
I am sorry to create this confusion. I have created and sent the new
patch which you can apply over the old one to fix the issues.

-- 
-
Abhijit
