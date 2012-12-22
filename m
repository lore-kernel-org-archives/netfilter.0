From: Ronnie Zheng <jeromezhr@gmail.com>
Subject: iptables will match the following ICMP request packet as ESTABLISHED
 state after the first reply packet is sent
Date: Sat, 22 Dec 2012 14:55:34 +0800
Message-ID: <CAMQZvgFzqJer2pxA_G6hWtfxFqUn54hKTDmBJyP1K_fnT3cOCQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=QZUGX9pTUU63Trisqh9yT51QWF99UTUuuVP0UIPIKp0=;
        b=qaTrMlOB4zxgJ9GV32+UH6+kff/CQxDReF2yjLgSvMJ/U9zgBgb56fq36uwKU3Bq5D
         t99b2SGu+MoM4rTXTx9lZdARh9PWmt8UcPk5wrzxDP+PABdzIm6lIOaPTlv/RgwnyYCk
         nio2ZvCjMgtaiAbRxOBpqWWiDj354zwmeUqUmA3cuIOyYMW943yOC00wcj/emHmVqopD
         fvECqzOZNPkkOFhfSPNkpJSn2jAzeLTDLEG0kj6DPYBNKd+ivfeB7SHmMVZMFf0mnMht
         U2uw/VXW+mEiFJr1N3scL1ygrwlNnjLLFHtdLCzJNjPxYz92afOgK6NMth4f5JCvmWhL
         Bq3Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Test environment: CentOS 6.3 - kernel 2.6.32-279.el6.i686, iptables v1.4.7
Win7 <---> CentOS
Windows is constantly replaying ICMP echo request in 10pkt/sec rate to CentOS.

In iptables, I added the rules as below to limit the incoming icmp
request packet rate. But it didn't work. Because after the 1st
incoming icmp request was accepted by the 1st rule and my host
replied, all the following ICMP request will accepted by the 2nd rule,
which will accept the incoming ICMPrequest as ESTABLISHED state
packet. I think this doesn't make sense.

ACCEPT     icmp --  anywhere             anywhere            icmp
echo-request limit: avg 1/sec burst 1
ACCEPT     all  --  anywhere             anywhere            state ESTABLISHED
DROP       icmp --  anywhere             anywhere

Expected result:
1 pkt/sec will be accepted by CentOS and 1 reply will be sent out,
while other 9 requests will be drop by the last rule.

Observed result:
1 pkt/sec accepted by the first rule and the other 9 were accepted by
the second rule. 10 echo reply were sent back. No pkt dropped.


I checked the "Iptables Tutorial 1.2.2" and I found the statement as below.
"The reply packet is considered as being ESTABLISHED, as we have
already explained. However, we can know for sure that after the ICMP
reply, there will be absolutely no more legal traffic in the same
connection. For this reason, the connection tracking entry is
destroyed once the reply has traveled all the way through the
Netfilter structure. In each of the above cases, the request is
considered as NEW, while the reply is considered as ESTABLISHED."

However, I found the conntrack entry was always there in
/proc/net/nf_conntrack after the first reply was sent. It will only be
deleted after 29 seconds once an ICMP connection is established.

ipv4 2 icmp 1 24 src=192.168.56.1 dst=192.168.56.101 type=8 code=0
id=1 src=192.168.56.101 dst=192.168.56.1 type=0 code=0 id=1 mark=0
secmark=0 use=2

I think each incoming ICMP request should be treated as NEW state not
ESTABLISHED even an ICMP connection has been established.
Correct me if I don't understand the state match in a proper way.

Regards,
Ronnie.
