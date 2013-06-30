From: Petr Chmelar <chmelab@gmail.com>
Subject: ULOGD2 Help
Date: Sun, 30 Jun 2013 20:26:29 +0200
Message-ID: <51D07855.2060508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=MsGXLXLX3iKMFUg7y+oj5jgVDJi5R0p8kt1LfLCLDzk=;
        b=FmgVnzlQscyUD8BOC/9frdeqAF07CIty1UOpdwEB+LXFRgHOwp/Ym00/DxXLX0rNmB
         YnxVwA4eigJt1jx+6GlqhKnhBuaHDNs46scC3kjsjRswHwhnk+V94/X7b4VffHD3t8ux
         b05W+sbaUg2U53vymGsq54Fn94Ck21bDXt4mp1qekmlOiiTRkYtAAgVnF4JRjbnzMNUd
         ME3RYREvYV+pxJFdozk6eQQNr+IjvBWgm+magxUi7PlJWbvTe6lt9pDtqW92VtWv39Qq
         ma0cae4jdsKz6U+adbwXd5DaFRggdejutfVCn+9H6Zj/L3eaSAoKJpJejJQjZmMKDN5A
         mW1w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi there,

we are trying to use the ULOGD2 to produce net flow and "sums" into one 
PostgreSQL table. We have some questions:

Where is the nflog-prefix for NFCT (ct1) and NFACCT (acct1)? I tried 
almost all of them (0 to 32), but no luck. NFCT works fine, if I turn on 
UFW firewall - is this a standard behavior? How do I make NFACCT work if 
the UFW method under Debian/Ubuntu (and CentOS) doesn't work.

The NFCT plugin doesn't give numbers of packets and sums of their 
lenghts. From the documentation and source codes there is unclear how to 
chain plugins - how can we interconnect NFCT and NFACCT so they produce 
output to a single PostgreSQL table (ulog2_ct)?

Can you send us the config file, please? And the iptables command? Is it 
possibe to use something like:
iptables -D PREROUTING -t mangle -j NFLOG --nflog-group 1 --nflog-prefix 
pre1 ?

Thank you,

Petr Chmelar

