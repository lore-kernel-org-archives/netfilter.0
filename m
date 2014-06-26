From: Kamal Kumar <malkarikamalkumar@gmail.com>
Subject: Sub: NAT issue in netfilter
Date: Thu, 26 Jun 2014 15:14:51 +0530
Message-ID: <CAJQ3KZXNSCgV0mRx6jDwWk85sJRFY5pKKFJbLuzaEmW1kzFAfg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=2/OydKxX5+eBuF37n+cTa6tFxeToWj/GHljeOroIOkI=;
        b=oHVF+92NS1cnWroUavah8++95l2AAVUMrK5i4a1Xmd93+IW2yMq7+595kfp1qidyvp
         PtxomB+UBsBG54E5r1+fMIT24n3U9+OcXjQHp8PWHY99XZ6Twj89sfY7xsKB+1mGLJCw
         MKZQI9DpokFfDRLiITAJcnxjcpVnyydSsecdMWqIzahuWVBDxSeOOMTbBO9DaMWDUCky
         mkXUUNIdGHf7KZQhd0douJEzPQVt58LjJlRCBaiSD6hRsJzJvtFaEpI0s6bTBGYroiLk
         O9VfyYmMQQGuF9Y7OaUps3ZM5PHmcxCivFN7Ez9tpDxSsHU0v0LXtoIaDUmkc/OfjNKP
         79Ng==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Dear Hambourg,

My response to your previous mail,

> Below is my exact scenario -> Network 1 wants to communicate with Network 2 using NAT enabled router with two ethernet interfaces eth0(192.168.1.1) and eth1 (192.168.2.1).

|    Network 1    |---| NAT Router |---|     Network 2   |
(192.168.1.0/24)   ^                  ^     (192.168.2.0/24)
                             |                  |
             eth0(192.168.1.1)   eth1(192.168.2.1)

> What I did is as mentioned below.

>Step1: I am applying the following command "iptables -t nat -A POSTROUTING -s 0.0.0.0/0 -d 0.0.0.0/0 -o eth1 -j SNAT --to 192.168.2.1" in nat router.

>Step2: Started initiating traffic(ICMP) from network 1 to network 2 and using wireshark I observed source ip of traffic from network 1 being translated to ip 192.168.2.1 in nat router.

>Step3: With traffic from network 1 to network 2 in PROGRESS I am flushing the nat table using the command "iptables -t nat -F".

> Now as there is no rule the sourece ip of traffic from network 1 should not be translated to ip 192.168.2.1 (which is my requirement), but it is being translated.

> What should I do to fullfill my requirement.
