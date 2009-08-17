From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: qos and iptables
Date: Mon, 17 Aug 2009 21:39:49 +0530
Message-ID: <cfeab66d0908170909s7e223506g891bb405dd313343@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=/og2lQlapDjmaIhQSbzVoDFpoy8uJLH3e3N/xYLxyO0=;
        b=gtxfmqn0/KdiCdNjfV6nqIcbTUGy3AG47T/JPlHy4bQlLFQMXhh2YW1ZbpJrwhy7uv
         4DiuZe2UdKZz10t9YHwqg7oI4LGHmE4majU+VPPqoRNNMLV1HbBxvN/KB9S1syxQQY44
         xeqQcS21HJSRJafmREZQ9mAdxVIj2r1xkDYeo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi ,




lan
                                                wan
---------------------------->              eth0
--------------------------------------------> eth1
--------------------------------->

suppose a packet is  going  from lan to wan .  First it will go

 prerouting chain -----> forward ---> postrouting   chain




i want to know when qos rules on both interfaces will be executed with
respect to iptables chain  ?? .  forward chain  will be executed after
 qos rules on eth0 is executed , ????
