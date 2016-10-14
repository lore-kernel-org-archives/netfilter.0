From: Gargi Sharma <gs051095@gmail.com>
Subject: iptables-translate command not found
Date: Fri, 14 Oct 2016 21:14:02 +0530
Message-ID: <CAOCi2DEkJ3JOJdYUK4_jX3cfdP7Rwje7zioqLBaj5Um3HoiT8Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=qCgafb9kn6IUUrvuV3vQ6WCAJz3T1veWKyWDlINuTPY=;
        b=0FDzhg8J03M0KwOourhIzJXHCRPXuuchWGn7NAXuMwZayGsWZk8CZqCCJ5jjMnk29G
         c8EoRRKOGhRUnwvDGXRcVKZIAAt9XA01x2j1/LPq6WQH1qy2E5CMgouxlRBNXuMNQEaG
         Vylp/87DE4XIAyKtXjaumJ08s/cjhSWGB6hctgydoLiI+kiyN71FeP3qvmZymNe8G2BE
         loVyiKGSAeNchs8mcbhdxannwCx3naGa8f6y80QgHqgaoJo9F9Kk6waCAKzvBS0ctAok
         xNElay+Ke86m+jXw1e/nahjWMWdT77l9ABMICvJZifUXN2sxVXkhjhSGW2VHWUADRbei
         IxvA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi!

I am looking to translate iptable rules to nftables and when I run the
command sudo iptables-translate I get , command not found.

The path for iptables command is /sbin/iptables.

The other commands related to iptables that are available are:
iptables-save
iptables-restore
ip6tables

How do I install iptables-translate? From what I have understood from
looking around is that iptables-translate comes with the iptables
package.

Thanks!
Gargi
