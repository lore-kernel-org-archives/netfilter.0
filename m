From: "Servers 4you" <servers4you@gmail.com>
Subject: SYN flooding
Date: Sun, 9 Nov 2008 13:59:51 -0300
Message-ID: <98f5d92c0811090859n1df8231fy750b5930f565fdc6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=LWPOksOBdjAIGyv1IlxdtCf3DbIP0QzRN8rxKwhAWHE=;
        b=wR8G1FQ1QMWrzl6HkxzfPrpd7IRm0PerrK+Hb5Jpw+Dpg3TuB99Z1KtsMd9IZ/zuqt
         CNusC1fxPgJgOhFT7ZvwNdP1QghqfvTva0qsp5vAb807wtE3VZI3VM815x/kMZJYgvR9
         7pRJeHGTtBR6IR3F1PAHEumKc8KFfX4534/14=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Im having this notice on my messages logs:

Nov  5 06:40:46 workstation kernel: possible SYN flooding on port
38211. Sending cookies.

(i have and app running on port 38211).

Is an way to block it with iptables?

thanks in advance
