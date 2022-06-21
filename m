From: Kiernan George <kbg98@vt.edu>
Subject: Create Rule w/ Source IP Example
Date: Tue, 21 Jun 2022 15:41:39 +0000
Message-ID: <1e1957fe-2bbf-699e-bdfd-28c88fff363a@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=LUIjUUmuaMeWyIm7OUHlMOyuwh4EVSUUJ2Bh5jvLrVE=;
        b=Bb68BdABIBsZOJTczru+dRr223m1E3oascWd6wmmuMZy48S0LWXU79ZdZ14JvDTWQp
         SXKrSRSe1RhUFgmIuGgQ5iX7cYjLaLMVauPG7Co1NIvktT8f1VlhbG8xic0Z9SPWNWQ4
         oVSJjMaALj6QsXXRpxPMWGji7W3xy21aJ08C4mJUYh/JhfLYEazszymkQ48HI6xeKqmR
         z3OaD/eFf5W8wBEwPrRa+RJGLa1VjRTyLqkpt/aobAr1yU+UPHRWDwI9NTySYTeAB/CK
         ApP4g3LKLzbd7jTlXSCTELDDRssq8p+V1b4asMm7YbN6N4VpOvKns8eO9/Xhcdck1feS
         5TKA==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Could you provide an example for adding a rule with an IP address and a 
protocol in it? I am currently getting this error with libnftnl version 
1.2.2:

nf_tables kernel ABI is broken, contact your vendor.
rule.c:355 reason: Numerical result out of range

I tried following the examples, but unfortunately there is not one that 
does what I am trying to do, and I can't find any documentation on how 
to use the API past what the examples show. I can create tables, chains, 
maps, but I can't get this to work.

Thanks for your help,
Kiernan

