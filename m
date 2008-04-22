From: "Mike Herms" <mherms@gmail.com>
Subject: NFQUEUE handler source example
Date: Tue, 22 Apr 2008 10:04:18 -0400
Message-ID: <c1ae779f0804220704s3a419fbu2e507ced85a6aa06@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=F2WugHEiEAbhcstamgaUTA4tzm+8a8Fz4QBoPL5iREs=;
        b=oz0M+XZ5AJ6v71PE1QBDuRUWBjntvxqRe0Yy3ULrWNUBY566lnfzAFAGeGJbPMCkd9K3MFc/1PWGx43efcICVj/VAuOdEmcM+u0G3f3JBPjV1SSAy+4LbtLICKpAaZk5wh3vlEtU2Zn1o6gH1g5t6uZvpu2U5cFw23sEQ4hwW7A=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Short question:
Does anyone have example source code for user land handling of packets
off of NFQUEUE in a bridged environment?  I believe that I've
successfully created a bridged environment as follows:
============================
ifconfig eth0 promisc up
ifconfig eth0 promisc up
brctl addbr br0
brctl stp br0 off
brctl setbridgeprio br0 2
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig br0 0.0.0.0

echo 1 > /proc/sys/net/ipv4/ip_forward
============================
Using the above configuration and connecting my box between two
networks or a network and a client computer works great.  Both sides
work and the bridge appears transparent to them.

I try to handle packets in my userland application by sending them to
an NFQUEUE using:
============================
sudo iptables -t mangle -A FORWARD -m physdev --physdev-in eth0 -j
NFQUEUE --queue-num 0
sudo iptables -t mangle -A FORWARD -m physdev --physdev-in eth1 -j
NFQUEUE --queue-num 0
============================

After I create the above two rules traffic no longer gets through the
bridge, as I'd suspect since it must now be handled by someone reading
from the NFQUEUE.

============================
sudo iptables -t mangle --list -v
============================
Shows packets reaching both physical devices.  My problem is I cannot
get my application to get a notification that something is in the
queue so it can be handled.  I'm can post my source but a working
skeleton example would get me there just as quickly without people
debugging my code.

Version information:
bridge-utils v1.2
iptables v1.4.0
ebtables v2.0.8-1 (May 2007
arptables v0.0.3-3

Thanks,
Mike Herms
