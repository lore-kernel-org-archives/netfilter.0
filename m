From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: making QoS for FTP traffic using tc HTB
Date: Mon, 19 Jul 2010 23:17:28 +0000
Message-ID: <AANLkTiltEFL_FDC2Ah1RedeQTDHji94UbAGUyn39lT1e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=lWtmB4QvKjtjZvosQtcNiNANMOVzVy7Vfx4NIaa3HVE=;
        b=GtTiUw1+4rg24kdmBOIoEgwamE51iTyM95/0Tr6JWxgjJcj4/FlBpVxC8MN642cma2
         gqIt98kuO3qf2gzacnyIpAaBInGIxPHd5gO8FeZMyR7N89Nck1/hx/wtou8iQ6pf0EsV
         eyW8Pj8t8wOS5AKufIRITTVKlaj67ivwa9I5U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,
I've some problem with making Qos.
All my pass through a linux box which is in Bridge mode.
I'd to implement a QoS to allocate 25Kbit of bandwith to the FTP
traffic. So I've made these commands:
--------------------------------------------------------------
tc qdisc add dev  eth1  root handle 1: htb default 1 tc  class add dev
eth1  parent 1: classid  1:1  htb rate 50kbit ceil 50kbit tc qdisc add
dev eth1  parent  1:1  handle 10:  sfq perturb 10

tc qdisc add dev  eth2  root handle 1: htb default 1

tc  class add dev  eth2  parent 1: classid  1:1 htb rate 50kbit ceil
50kbit tc qdisc add dev  eth2  parent  1:1  handle 10: sfq perturb 10

tc  class add dev  eth1  parent 1:0 classid  1:1007  htb rate 512kbit
ceil 512kbit

tc  class add dev  eth2  parent 1:0 classid  1:1007  htb rate 512kbit
ceil 512kbit

tc  class add dev  eth1  parent 1:1007 classid  1:8170  htb rate
25kbit ceil 25kbit

tc qdisc add dev  eth1  parent  1:8170  handle 8170:  sfq perturb 10
tc  class add dev  eth2  parent 1:1007 classid  1:8170  htb rate
25kbit ceil 25kbit

tc qdisc add dev  eth2  parent  1:8170  handle 8170: sfq perturb 10

tc filter add dev  eth1  protocol ip parent 1:  prio 1 u32   match ip  src
192.168.2.88/32  match ip dport  20  0xffff flowid  1:8170
tc filter add dev  eth1  protocol ip parent 1:  prio 1 u32   match ip  dst
192.168.2.88/32    0xff match ip dport  21  0xffff flowid  1:8170
--------------------------------------------------------------------
The filter tc filter add dev  eth1.....
Is never match for the FTP downstream.
Can someone help me troubleshoot.
Regards.
