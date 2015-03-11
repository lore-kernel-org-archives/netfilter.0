From: Murugan Venugopal <muruga86@gmail.com>
Subject: Issue with "conntrack -U -p tcp -t xx" cmd -- need to update TO for
 specific TCP state filter
Date: Wed, 11 Mar 2015 12:40:25 +0530
Message-ID: <CAMVHObOGSqQP8BxEOvTb+K1QeQjs8--08275cZUvJZTfG+_mYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=LhncVGzObC6/Okz43pi0ok7ehtpcnbKJfUa7JcfESsM=;
        b=BauUFlTXvKcKoOT2q/eZvG2bbIAUVdwIRrDumusDlN3Hxdk6FEwyBTBk2ZknaoK7cu
         j8IKEkS7jPnDw77Bne1Pr1Dyyv25nFKNZ6n55ydQ2odDV3yT4tO2Q2fSGhaprBT46Nvd
         hASqbUq1GwSIThYD8On4Q951UBIjvs4dcvg+o4AVDI6wLvffnkxppkUHC/MF3PLj13HU
         TZaq+7/yPySPmy1iJm7O2h3r0lEbUSWxgWOVT5Dxug04LaqPbNSreohK7nv8QL/kIdmL
         iZB9Mqbod5ylOwDfXCQqJWYikmVP5fxPpEfa3aGWlP807fVAc7Q7halkIXkfjpsqLAJR
         U72Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I face an issue with "conntrack -U -p tcp -t xx" execution.
I could not update timeout values for specific TCP states like
Established, Timewait state etc.



conntrack -U -p tcp -t 80  --> updates TO value for all TCP connection state.

#conntrack -U -p tcp -t 80
#tcp      6 80 TIME_WAIT src=192.168.3.254 dst=192.168.3.254
sport=42218 dport=23 packets=77 bytes=4077 src=192.168.3.254
dst=192.168.3.254 sport=23 dport=42218 packets=55 bytes=3076 [ASSURED]
mark=0 use=2
conntrack v1.0.0 (conntrack-tools): 1 flow entries have been updated.


conntrack -U -p tcp -t 30 --state ESTABLISHED (or)
conntrack -U -p tcp --state ESTABLISHED -t 30  --> updates TO value
and states for all TCP connections.

# conntrack -L
#tcp      6 117 TIME_WAIT src=192.168.3.254 dst=192.168.3.254
sport=36047 dport=23 packets=51 bytes=2705 src=192.168.3.254
dst=192.168.3.254 sport=23 dport=36047 packets=36 bytes=2035 [ASSURED]
mark=0 use=2

#conntrack -U -p tcp -t 30 --state ESTABLISHED
#tcp      6 30 ESTABLISHED src=192.168.3.254 dst=192.168.3.254
sport=59521 dport=23 packets=82 bytes=4339 src=192.168.3.254
dst=192.168.3.254 sport=23 dport=59521 packets=57 bytes=3181 [ASSURED]
mark=0 use=2
conntrack v1.0.0 (conntrack-tools): 1 flow entries have been updated.


Do we have any method to update TO values only for established state
TCP connections?

Packages used:
conntrack-tools-1.0.0
libnetfilter_conntrack-0.9.1
libnfnetlink-1.0.0
iptables-1.4.16
Linux kernel 2.6.34.8

Regards,
Murugan
