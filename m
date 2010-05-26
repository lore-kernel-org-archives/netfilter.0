From: senthilkumaar2021 <senthilkumaar2021@gmail.com>
Subject: Squid + Tproxy + Bridge on Kernel 2.6.34 - Workaround
Date: Wed, 26 May 2010 09:51:39 +0530
Message-ID: <4BFCA1D3.3060505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=+lI1eyFvnyQMyfnpH3vMY683IW0EehislShCAXaXpg4=;
        b=N/wU13fF/6n+JRrPL2CgGKIlKXrON1qBkEGcqsyLIZ89lyJBaM/7kQc69KoZPDjS/0
         dU6YgpME8OUSPLusTWRiw1Smpeifqcj4UObw+o8llYPGETj21RbUfary/uh4Q+PTrYSu
         QzBJe4uTrXn01bqd7BURtcVWFhcrl5EnGRp64=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: squid-users@squid-cache.org
Cc: netfilter@vger.kernel.org

Hi,

Squid + Tproxy + Bridge Setup on latest kernel - version 2.6.34

I had followed all the steps that had given in the
http://wiki.squid-cache.org/Features/Tproxy4

Kernel - 2.6.34
iptable - 1.4.8
ebtable - 2.0.9-1

But clients were unable to browse and no errors in cache.log. Error -
Network Unreachable. The error had returned by browser not squid proxy.

Workaround :-

After adding the following rules, clients are able to browse.

# ip rule add dev <device name> fwmark 1 lookup 100

example

# ip rule add dev eth0 fwmark 1 lookup 100

NOTE : Repeat the above for each interface except " lo "

Source - https://lists.balabit.hu/pipermail/tproxy/2010-January/001212.html

Based on the above source this issue had identified on kernel version -
2.6.32. But still not yet fixed.

I have CC ed this mail to netfilter mailing lists also.

Hope this helps

Thanks,
Senthil



