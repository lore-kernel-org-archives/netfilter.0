From: Alex Flex <aflexzor@gmail.com>
Subject: Re: synflood +syncookies + conntrack strange behaviour
Date: Sat, 11 May 2013 12:05:40 -0600
Message-ID: <518E8874.4090801@gmail.com>
References: <518C479D.1070904@gmail.com> <518D8BBB.5050406@gmail.com> <20130511022114.GA7793@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=RiaRyyQBocgB7woxhRZB/Vwto9EirU9Rx1WOgDuFW40=;
        b=ftcBm6ty4Bw3D5bOdQIP5x6jiOaWHCPRmpCIV//iHPxKFYijbYYmibO7MHPQJGK1zn
         VXlWpogwN9WEflpHvdLbTLyEmJmWG8ihDPnnUu/achIulrFe1MBGW85VgMBDaGrn+EUq
         az547EFot2n216dA1g5E5JfzXhDZGCFK+P9oEMw21pPSD0demnEqK70/FfCvg2LXzqLE
         BpTTrtMc6SiX0Df2llP70irg7isCpNiYNz7Lqscobu8nrHDPaj6rwOrE8q3ZpjagA8vH
         kcdchyGrsTtsmCWypTHJH3a3J7HhcpOHHnSQO2byMXoUxO1VJ5CJaqGAJa71M1LtGHnK
         7Hig==
In-Reply-To: <20130511022114.GA7793@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Pablo,

Thank you for clearing that aspect! I now understand why not always do i 
get an error...

However the following two points still have me confused..

a.) If I enable syn cookies, shouldnt it stop completely the SYN RECV 
state connections in my netstat? Because i still do get them a lot. In 
fact my tests reveal that with or without syn cookies the maximum 
connections in SYN RECV always reach 256 and then no more connections 
are allowed.

b.) I  tried disabling iptables all together (thus no conntrack) and I
still saw 100% packetloss , iam sure iamnot hitting a  cpu or link limit
because previously i hit a 100k pps 50mbits, and now iam doing half that
for testing and still using syncookies. Why would i still be lossing
packets?

Thanks
Alex

