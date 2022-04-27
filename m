From: Jesper Dybdal <netfilter@dybdal.dk>
Subject: Conditional inclusion of parts of nft file?
Date: Wed, 27 Apr 2022 12:24:59 +0200
Message-ID: <950f8e47-fba0-33d9-786e-a48c31c3c775@dybdal.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dybdal.dk; h=
        content-transfer-encoding:content-type:content-type:subject
        :subject:from:from:content-language:user-agent:mime-version:date
        :date:message-id:received; s=dybdal-20171111; t=1651055099; x=
        1652869500; bh=TzYCLeM/VpynkTAwZTRCWf6e/LjyLpPnkRWXMO5LBns=; b=E
        XliZbMn9wCX1jG9FtSSOj86baEv37suXsi2prAU82UNdtpp1oYZZ89LPwPkUJ/vy
        ejCcAwNekKc2A7FLMlz/t58/YLI0rrmp3CeScg2LTrbWgv78MSu6ptlnjLQabTyn
        LbhQM5GVFWB7PemOMeUS/2pf2rapTybpgIbRfpSIkxbyGC3UzPSLrZ72MFst2rE5
        uo0Bh7Pk2YATHHF8jEvJUEX5F1r3quD9SXKoT1KSfmzN7U+1SZQGsZbYKsAmfXY5
        A1X7q3mmTLi7zA5LPskG72L0yVDT5A/PfcWozFyVAynoWeV84L/wLCUvpuA0JOti
        jHviLMrj83hW/uqU6Tv1g==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

I am beginning to plan my change from iptables to native nft.

My iptables shell script has some conditionals where rules are included 
or not depending on environment variables or other conditions that are 
known beforehand.  Example: whether or not all interfaces, or only some, 
are up.

Is this possible with nft?  I.e., something like:

    define externalinterfaceready = 1
    ...
    if ( externalinterfaceready) {
         ... add rules depending on the external interface being up
    }

And even better if it could query environment variables.

I haven't seen any description of something like this being possible in 
a less clumsy way than dynamically building an include file for every 
"if" and include them in the ruleset at suitable points.

Have I overlooked something?

Thanks,
Jesper

-- 
Jesper Dybdal
https://www.dybdal.dk

