From: Anatoly Muliarski <x86ever@gmail.com>
Subject: ebtables & VLAN redirect
Date: Sat, 26 Jun 2010 15:43:47 +0300
Message-ID: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=8yhINgGSWpGbON9PD+zG4WU0IKt1NzoyPUpg8jQCXbs=;
        b=IUCUJzFMXlKxXhcuyv7ULWlkoz9HfKFWj41ed9C+lKhxNDyR3BI5ghVAZc0li1NVg1
         uDst0SxGXlXzd2vRm+bKYvVlKysJvZHJZP9uI2Lg5d7KsXPWCFtLxglO8kcLFjsPyetm
         Ia50xuImLDIo6EQn0lV/vOSW0ExgOsRMMbbU4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

I have a lot of VLANs( eth1.100-eth1.200) and I need to redirect
specific IP frames arrived on them to VLAN eth1.9 on L2 level( as I
cannot use routing for them ). The simple way is to create a bridge
from all VLANs and filter out redirections to
unwanted(eth1.100-eth1.200) VLANs.
But this may cause preformance issues. Is there a finer solution?

-- 
Best regards
Anatoly Muliarski
