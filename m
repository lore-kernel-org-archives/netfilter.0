From: "" <kfm@plushkava.net>
Subject: Re: nft multiple port exception
Date: Sun, 26 Jan 2020 14:07:18 +0000
Message-ID: <c386de5e-f500-880e-64a1-aae6764d3bbc@plushkava.net>
References: <88552dfd-377b-c0ac-aaa4-ad7868348758@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=F
        AHE3x1+/sm+fVcFeeMJCs/QScatHBGwodBs1f7tg6A=; b=E/Q2sjyOuMYzEMPu0
        Y3dTYkjTDPU6sFxrzWr/SYKccVsaFUfU9S4vWYkWHg1Y8sHHMaJxWMKmxqRhcfBC
        hZRvkrvd121YKEsPmL5xQ5uv5AePqny509s5zZWpPjWX1rwK2xcIqy/FQ0MY1rQE
        a90ob6zKf3MkNNvuAF+tG2KDIqJqDTjJclaBmDHYUsVQ8AriHXgOnA4l4UgH3cp0
        B6SEGBuHMeW7iIFwvUKhOQ5lPKPHXfvSRfZwD4mxMnIaQWIXNbwXb72wceyIFn5S
        Y237hyQKeU/MzntUyMHO5UEYkQ1M7rFoOHWDiwKl5I3QuFLnr+3L0WUjrzuL7zdD
        Qmg4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=FAHE3x1+/sm+fVcFeeMJCs/QScatHBGwodBs1f7tg
        6A=; b=E+N6/HoCByo28Lz2Os/mnInCn+qtjNt8a0IV3DDF61KZnbHTycOzfvf/i
        l8+0Z3On7156+KfBiWiaQ0/Qkke8GhMWl5XkmzMxFdavLfN9vCa3uSoTA8RKFL7W
        2n5pbVNpzlV89ECaFm4CyaCpRpodxrvJ/8KgYU8dPlWxQ9gGDaKgpw0Qx6J96cpF
        YIGE1ogmVio6rWFBlU5oZZew9IlDaWCEAUn1xQ6IuihA1DVzQWBBBFXJjPO1L4iQ
        UimwnlC+ukTA5EF2HBi73m2mRo5xHBcg/rT8RV3YaKxuMhHEk8ktTQndlx0Vk+zq
        T+1nNKLjfKwIwPVYBaMKN/53mxzIQ==
In-Reply-To: <88552dfd-377b-c0ac-aaa4-ad7868348758@hajes.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 26/01/2020 14:01, david@hajes.org wrote:
> is it possible to use =! exception statemenet for multiple ports?
> 
> ip saddr xxx.xxx.xxx.xxx tcp dport != { 80, 443 } drop

Yes.

-- 
Kerin Millar
