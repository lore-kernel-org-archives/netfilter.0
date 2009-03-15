From: Andrew Beverley <andy@andybev.com>
Subject: Creating an equivalent to ESFQ using flow classifier
Date: Sun, 15 Mar 2009 16:29:23 +0000
Message-ID: <328bad7c0259fd816ae31c8405313e1e@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=andybev.com; h=
	mime-version:date:from:to:subject:message-id:content-type:
	content-transfer-encoding; q=dns/txt; s=selector1; bh=AQw06tUUc/
	xpemyCyXivexiuTtg=; b=ukPWzUtZ8/NI94TyfxolIoWAC/d3aKZ8ZQ5jNofxRE
	3BnVhrMExoO8Wb2UqRKdSsqdvgixU/9jbFh9w6J5lHNpEztzFvYvD1WZLAmwRPyU
	S3IAP9eiLVb7p3PVnCL+45J/QiO73B0Ej2dv2nxmn15YVfmfuCpOuZxWPXIFkjVu
	s=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a server which I am using to share an ADSL line between a number of
users. I am successfully shaping traffic based on type using 4 different
classes, but I also want to share traffic within those classes evenly
between computers (rather than between connections). I used to use ESFQ for
this, but am trying to move to the new flow classifier as described in
http://www.mail-archive.com/netdev@vger.kernel.org/msg60634.html

I have set up the following rules. However, if I start 4 downloads on one
PC and 1 download on another PC, then the first PC will get 4/5 of the
available bandwidth and the second PC one 1/5. I would expect them to get
half each. I am using HTB to shape between each class.

# Add a HTB qdisc to the root device
tc qdisc add dev eth0 root handle 1: htb

# Rate limit it
tc class add dev eth0 parent 1: classid 1:1 htb rate 2200kbit

# Add 4 classes to it for different traffic
tc class add dev eth0 parent 1:1  classid 1:10 htb \
        rate 100kbit ceil 100kbit prio 0
tc class add dev eth0 parent 1:1  classid 1:30 htb \
        rate 1000kbit ceil 1000kbit prio 1
tc class add dev eth0 parent 1:1  classid 1:40 htb \
        rate 1000kbit ceil 1000kbit prio 2
tc class add dev eth0 parent 1:1  classid 1:60 htb \
        rate 100kbit ceil 100kbit prio 3

# Add SFQ qdisc to each HTB class
tc qdisc add dev eth0 parent 1:10 handle 10: sfq perturb 10
tc qdisc add dev eth0 parent 1:30 handle 30: sfq perturb 10
tc qdisc add dev eth0 parent 1:40 handle 40: sfq perturb 10
tc qdisc add dev eth0 parent 1:60 handle 60: sfq perturb 10

# Filter the traffic to each class based on MARK
tc filter add dev eth0 parent 1:0 protocol ip handle 10 fw flowid 1:10
tc filter add dev eth0 parent 1:0 protocol ip handle 30 fw flowid 1:30
tc filter add dev eth0 parent 1:0 protocol ip handle 40 fw flowid 1:40
tc filter add dev eth0 parent 1:0 protocol ip handle 60 fw flowid 1:60

# Share traffic between each PC evenly
tc filter add dev eth0 parent 10: protocol ip handle 10 flow hash keys \
        nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor 1024
tc filter add dev eth0 parent 30: protocol ip handle 30 flow hash keys \
        nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor 1024
tc filter add dev eth0 parent 40: protocol ip handle 40 flow hash keys \
        nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor 1024
tc filter add dev eth0 parent 60: protocol ip handle 60 flow hash keys \
        nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor 1024


It is the last part that I am unsure about. I do not get any errors with
the commands, but they do not seem to make any difference to the shaping.

I am using linux-2.6.26 on Debian Lenny but have also tried linux-2.6.28

Thanks in advance

Andy Beverley
