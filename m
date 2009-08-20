From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: bridge tc fw filter
Date: Thu, 20 Aug 2009 21:01:40 +0530
Message-ID: <cfeab66d0908200831r4148a9e8gc67647ba600c3850@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=QBZQe9C031f0DGBfoHwi3rIA+miVQNtSPpOvu5wnaJA=;
        b=FpXilGZlTPihkBkPgIuwRLVZA3URNouDQQ2iJKBE9tiSRMRoIVxl461Ix1fXA2pt+A
         nwCQ2XCM5VOtUZI4O4bZu2Vby7vw1bjkmF9ag50ctPlj1GSyWDEf0Oj+f0/eIAGVbzFy
         idNBhZcFgOPoI0ZzpY5q0+B+kBnuTJaKiHpno=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have two interfaces , eth0 and ap0 bridged together to form br0 .
And another interfaces eth1 on wan side .


                  br0 <------------------------> eth1
              ( eth0 , ap0)
                {  lan  }                         {wan}

packets from lan side are nated  to eth1 .  i have qos rules on both
br0 and eth1 .  when i googled i found that "mangling packets on br0
and using fw filters wont work on linux bridge ".. Is this true ?? Can
you tell me why ??

But the funny thing is i colored packets  in prerouting chain  only
specifying protocol ( not specifying interface )

 iptables  -t mangle -A PREROTUING -p icmp -j MARK --set-mark 2   and
i have filter rule to put  packets tat are fw marked as 2 to put into
some flow . This works fine , when i send an icmp packet from lan to
wan side !!!!!!! ??????????

But if  try any of below rules  intsead of above ,  it wont work

iptables  -t mangle -A PREROTUING -p icmp -i br0 -j MARK --set-mark 2
iptables  -t mangle -A PREROTUING -p icmp  -s 192.168.1.0/24  -d !
192.168.1.0/24 -j MARK --set-mark 2
iptables  -t mangle -A FORWARD  -p icmp  -i br0 -o eth1 -j MARK --set-mark 2

i dont know y ????????

in linux kernel  , in  net/sched/cls_fw.c  file  , fw_classify is
called every time  tc filter  is hit .
skb->mark is  zero when u use rules like

iptables  -t mangle -A PREROTUING -p icmp -i br0 -j MARK --set-mark 2
iptables  -t mangle -A PREROTUING -p icmp  -s 192.168.1.0/24  -d !
               192.168.1.0/24 -j MARK --set-mark 2
iptables  -t mangle -A FORWARD  -p icmp  -i br0 -o eth1 -j MARK --set-mark 2

But if u use
iptables  -t mangle -A PREROTUING -p icmp -j MARK --set-mark 2

the skb->mark is 2  , correct value .

This problem happens only with bridge . when i tried with one of the
interface it works perfectly .

Thanks,
Ratheesh
