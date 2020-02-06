From: Gordon Fisher <gordfisherman@gmail.com>
Subject: Re: [nftables v0.9.2] inet <> ip | ip6 family tables processing order?
Date: Thu, 06 Feb 2020 10:35:33 -0800
Message-ID: <5E3C5C75.8020403@gmail.com>
References: <dad1e392-ae29-a3bf-7411-d1dfe2095de2@gmx.net> <20200205112104.GA26952@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=3Xw7Hf3D+UuFQnuibNADkl+WWMiPvA82D7VQ2DX6ZiY=;
        b=AIsrDl6XXlNrB4lFJIkKaD5uZkPa7BqgM2MDZ09oC2qJvHnrteiiAVmVXqH7POWlO0
         CQvMAnJ/FG1J9a5s3wEDn3bRTGTX1A1uXasSKoDdtNEjJ0z5HeMEW5ZplAvykuaWtb9g
         gkv8G4zndrxJ/xfkG9vGTAeEhDRRDmcEkePiiF277i23CQovOO2QDgRNJtA3RonwL4th
         YiHl2oKdRXsb5CPAb7QC9c/QF2+ROM2Hdz7WiPyAIzg2acjp3W1dYg+3SV5fznzJLb02
         /FEjxK2IGXim3bfdneCrzzr+3V43s743TAvE7t83uoHUOglbQ4XySSZuDIuQyVf/0Maz
         +UJg==
In-Reply-To: <20200205112104.GA26952@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2/5/2020 3:21 AM, Florian Westphal wrote:
> In ip vs ip6 case its even irrelevant because an ipv4 packet will never
> travel any of the ip6 base chains, ever (and vice versa).
Out of curiosity, does still hold true for ipv4 over ipv6 set-ups?

-- 
gordonfish
