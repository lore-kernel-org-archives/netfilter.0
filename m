From: Roman Gelfand <rgelfand2@gmail.com>
Subject: Ver 1.4.17 Error Appending Prerouting
Date: Tue, 5 Feb 2013 18:13:37 -0500
Message-ID: <CAJbW+rmxKmvLT_g8c7Aj1zCfmEH6M6g2gHPx6_xnMBR43JY_2Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=JT4jRHljQxZCOiIwSzPNBTI1TzEoniCn5ZOt8Xt79dI=;
        b=hA7j+Y0ieywOTklhkuhbCrlMdtzFfT4NO0++yAVhPUTwKRsCfRvQbWBDOSL1kro3Ys
         qW/5Y4cCMdCLrsZ7TN30MkXX1j9CCzZHiynWVipxykN5nOB0MsIvYWh+u6XZRhPYkUki
         U0FcNb9uxdO9bdQ24aJKlbxbVTkEDDL1G9+l7IZA9cCXY+AilAXphngfek3gNzio/eUu
         l/cCQplBAWhCWqeAYidvRjT7zT5DBuPkEf5f89QbngR07fkjeF1htV6CX0Xxy+MRLWvt
         L+naDaU9gywx1LIX2DmMvNeu0Tj02DVAbE0lal30D19W2mKWoaLYPL0pwGZAC93VUzZf
         ScTA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have installed iptables ver 1.4.17 on debian squeeze where current
iptables version is 1.4.8. The kernel version is 2.6.32-5-686.

After running the following statements, I get the error below.

modprobe ip_gre
modprobe ip_tables
modprobe x_tables


/usr/local/sbin/iptables -t tproxy -A PREROUTING -i wccp0 -p tcp -m
tcp --dport 80 -j TPROXY --on-port 3228
/usr/local/sbin/iptables -t tproxy -A PREROUTING -i wccp0 -p tcp -m
tcp --dport 443 -j TPROXY --on-port 3229

Why am I getting the following error:

iptables v1.4.17: can't initialize iptables table `tproxy': Table does
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.


Thanks in advance
