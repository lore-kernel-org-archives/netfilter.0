From: "Ashok Rao" <greatarbor@gmail.com>
Subject: SNAT every packet in a connection
Date: Sun, 27 Jan 2008 21:47:04 -0500
Message-ID: <68252ab80801271847s35873e0fs19480eaf9c31f7fa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=99lkMilk+WpR4fMJHNjbvulkQV9RvDoQKCMX86SDvTU=;
        b=NNkvVG6mQQmrCNQSSGID56vQOrcu6Umrx4CLLXwwYCKnyuERimxHJgbH7NEv/35bf9TXjCvbrwe5KoB9J8QndrMFQiY4AUvGYZG6j1jMOtJVJIKD0jjJXdDABDCmq85hh9KUpR02amwjwTJtY2/so7dWM3aqrXr6NBbmS9Gd9TU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have 2 WAN connections on my Linux router and I'd like to do
load-balancing  of packets relating to the same connection.
There are lots of examples out on the net for setting up routes and
rules to send packets
to both links - and I have got those working - however I want to NAT
the source IP address of the outgoing packets based on the packet MARK
so that  I can make each packet  go out with the IP address of the
outgoing interface.

From whatever I've read and seen myself, the NAT table is only
traversed for the first packet of a connection.
Hence packets in a  single connection will always be SNATed to the
same IP  - Hence the packets going out on one of the interfaces will
not have the right source IP.

I'm starting to take a look at ip_nat_core.c ip_nat_standalone.c   -
would it make sense to try to modify those to achieve what I want ?
So far I've been using dumb NAT to achieve this  - but it is very
primitive.

Thanks in advance.
