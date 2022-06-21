From: Kiernan George <kbg98@vt.edu>
Subject: ABI Breakage - nftnl_rule_parse_attr_cb
Date: Tue, 21 Jun 2022 20:07:24 +0000
Message-ID: <fb274774-b42e-fce8-7018-2c21a93a4d38@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=/gIQyP4895HIwnQ0QD8Ye9WgecP7zbRvsY8AVfgCxY0=;
        b=p9thcrf8bkx1lnLN7pxyIkx8oWaNOqTuXx0HcA70MzyKk6f/AlK3PLJX3LCVigW1YW
         fYLeiYhaTH1aBbLsNix4M76Zi/jYsZH9DXAGiwaY4NK9TL1s8eHBJZk3jiW9LsZHgk6L
         d9u95n91LnUfg7rlb7tWVACamTlHQ5ipBTmU/KJR2kagN2WgzMvT2bDtdhLq4eNkgrwe
         WySIfstydZWm0axkdtr83AUSbAv6V7lFWB42U9ZtBsyJFSJMmCnRGCl7+pcB/mhMpmp8
         9p9vuwE33oXF5f+K+IXHJCcU48o+iFZe1JqwItJd5Y3PM1eFdavsjg3tTtVW3MXg3Vr7
         fRaw==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I am getting an ABI breakage error at these lines in rule.c:

case NFTA_RULE_HANDLE:
         if (mnl_attr_validate(attr, MNL_TYPE_U64) < 0)
             abi_breakage();
         break;

It only seems to happen when I set the flag NLM_F_ECHO in 
nftnl_rule_nlmsg_build_hdr. I want to hold onto the rule handle of the 
returned rule, which is why I set it to echo. This error was not 
affecting me in Ubuntu 20.04, but started as soon as I upgraded to 
22.04. I am running Linux kernel version 5.15.0-39-generic with 
libnftnl-dev version 1.2.1-1build1.

Thanks,

Kiernan

