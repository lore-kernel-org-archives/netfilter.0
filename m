From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: xtables/geoip vs ipset
Date: Thu, 09 Dec 2010 23:14:58 +0000
Message-ID: <4D0162F2.5050208@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=Vl7askQLMThLOridbvK1Kbf96peCL0hhGJ3G+bVl9Vw=;
        b=My/GPCuYUTuepNq0rRMn9vBpY+Ci2WtswtGHHyvSYvJsaVoG/4G3CloMjz1NaTN4Ao
         GdgYBAxozAEP/bRAED4jQxK4TVhj7ezjhWhyozJVZQdGIJ+g6gvpj4dS38HGAMGNJYRW
         scLOOiGyIVwcxMC8nOY5XUFJskTVUuQlNdlf0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Currently I am employing a large number of ipsets (about 30k+ subnets in 
total) which hold IP subnets fetched from whatever the latest version of 
the geoip database I have sourced and compiled.

I am aware that xtables also have the geoip target, though was wandering 
what the performance is like compared to having the same IP subnets 
loaded with ipset. Has anyone tested/compared these two matching methods?

I know the performance of iptables when it deals with large number of ip 
addresses is absolutely abysmal, so never tried to use the geoip target, 
so just wanted to see if that has changed?
