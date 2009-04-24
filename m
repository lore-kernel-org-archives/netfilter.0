From: Jedy <jedywu@gmail.com>
Subject: module string doesn't work without any error
Date: Fri, 24 Apr 2009 11:01:37 +0800
Message-ID: <29d7de5f0904232001t46e0ac24o74fecd69bc0511f7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type:content-transfer-encoding;
        bh=pXzb3KBeqQPRHynkPMh1HCOfCI7L6ZsoxauXO3hbs5A=;
        b=UxaavNoeGKxZ+aasuGN0zdP3PXMO/41uuL+rdrxz13x3Hv0xfopTQX3ZbAzGIU7J93
         jvMK0e1llpdx/2oel2myzBU8eXBXtABTC1GQziN+Xc3r5JIbo4WD8ImDTdTp70z2NWRF
         tTsyMe3lT8NjB71qaPpYVkLT3mjyIumGVA46E=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

The following command returns no error
# iptables -A OUTPUT -m string --algo bm --string show -j LOG
But it doesn't log anything when I'm sure package contains 'show'.

My system is RHEL4, compiled iptables 1.4.2,
I also recompile kernel 2.6.29.1 to support module string with
"CONFIG_NETFILTER_XT_MATCH_STRING=m".

Does anyone know what the problem is?

Thanks.

Jedy
