From: =?ISO-8859-2?Q?Bla=BE_Ba=E8nik?= <bacnik@gmail.com>
Subject: DNAT on another interfaces' IP
Date: Tue, 27 Jan 2009 15:38:46 +0100
Message-ID: <57b62e7d0901270638u75e23a92gf5f0e0c40cf61343@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=4lrfxxgRKzLRb3vNbBi6UCWzn+jLZR+lFz/L3yG02Jw=;
        b=H/ipoLpf3Kt4aD/6mpkvQd40XGeVFCxyeQ7IddlHjKpF69NsQQKuXpN6oIgABqhlB3
         /TFVVLd8zGHV8xHJyAmN++unZGyHTdgl14np1xcu3So/4+Mix8TbcPsHzc6f1sZFPI4V
         IN3d57dpkc9DNyqkxUi+Q3vap7EQ6MBBeeRE8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I have an embedded device (router) with 3 ethernet interfaces; eth0
(192.168.0.1), eth1 (192.168.1.1) and eth2 (192.168.2.1).
On it runs ssh server and it is also the default gateway for
192.168.1.0/24 and 192.168.2.0/24 . I do NAT with the following
command

iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 22 -j DNAT
--to-destination 192.168.2.2

If I ssh through eth0 (from 192.168.0.3) this gets me to 192.168.2.2
as expected. But if I ssh through eth1 (from 192.168.1.3) to IP
192.168.0.1,
I connect to router, meaning there is no DNAT in effect. Is this the
intended behaviour? If so, please explain why.

The problem here is that I would like to still be able to connect to
router directly through eth1 to its 192.168.1.1 address,
but connect to 192.168.2.2 if I use the 192.168.0.1 address.

Thanks in advance and best regards, Blaz
