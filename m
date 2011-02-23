From: Senthilkumar <senthilkumaar2021@gmail.com>
Subject: Squid with three isp
Date: Wed, 23 Feb 2011 10:41:20 +0530
Message-ID: <4D6496F8.9070303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=SEAl6sYLVPHj8LUbFfU/+tMY3LAvcF28SAOZCvELSLI=;
        b=Veqw1Bw6jRc0NC3hnx6sX4TlqdsX4PttLiOkagKBHuZwet0qbrFlaHQrkerjvXAPSk
         e0eMdpaTuhq1t7wFRvCAglKjPCnEjr+KflDl4FLVh1g7pWl5Qf85kMaj6TnvNB4FPqon
         nQGY67GRpxPQdYrYIra4UwQC1qzy9srSB3N14=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: squid-users@squid-cache.org

Hello All,

We have a gateway machine which has three upstream isp and to make 
clients use the particular isp we use advance routing based on the 
source address.  When we run squid  on the same machine to log websites 
all traffic passes through the single isp i.e. the isp which is set as 
default gateway. We need all the users to pass through squid and use 
different isp's as per source route.
Please share your views to achieve it.

Thanks
Senthil.

