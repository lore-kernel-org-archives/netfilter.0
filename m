From: Nishit Shah <nsshah.82@gmail.com>
Subject: arptables ruleset not working when compiling on fedora6,7,8/centos 
	5/redhat 5
Date: Mon, 29 Jun 2009 19:42:11 +0530
Message-ID: <b2d58cb80906290712k33c1ebbvfc8e661cb34c502c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=L3DX50y1fcSUTC6WQh6RjkX7vbRcTBSbe7rWhq0+Ufs=;
        b=Xe/xcXEhptSVpIyGC2lr+AE5djNOa0LpnC+BIYuZmDpDxaoppRMDI7aCbxVIUKfzel
         X/wJgJTjO6Git+WpuuBI2AfpWoE2ZZXzr1mHfCwwV5EUjGK3ybOJZ2DCrC/S9fqTNn5R
         A5o+SkPDNPT6c/P/LA5tIq1iFC8lCx3h9KUn4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Hi,
         I am compiling arptables-v0.0.3-3/arptables-v0.0.3-2 on
fedora6,7,8/centos 5/redhat 5. Module is compiled successfully.
Following are the simple steps.

        make
        make install

        Now, I am applying following rules,

        arptables -N user1
        arptables -N user2
        arptables -N user3

        arptables -A INPUT -j user1
        arptables -A INPUT -j user2
        arptables -A INPUT -j user3

       when I am doing arptables -nvx -L, I am getting packet counts
on only "arptables -A INPUT -j user1", no packet counts on user2 and
user3 chains. If I remove the user1 chain, I am getting packet counts
on user2 chain, not on user3 chain. It means only the first user
defined chain is traversing.

       all above machine contains gcc >= 4.1.2 and glibc >= 2.5

       If i compile the same source with machine having gcc 2.96 and
glibc 2.2.4 things are working properly on the above machines.
       Is it something related to gcc and/or glibc ? as I am not
seeing any issues with kernel space arptables code.

Rgds,
Nishit Shah.
