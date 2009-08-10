From: Steve Brown <sbrown25@gmail.com>
Subject: Poor upload speed with NAT
Date: Mon, 10 Aug 2009 16:43:14 -0500
Message-ID: <1f4ef0970908101443i28bf4c1hc6b280d4096fd100@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=hnmrN2XC87dsmYqhjuhUJhDM5ZhLT9aK74UBmSZ3evw=;
        b=GEp9rkrfRbbTLaOQkR5sS063QdAlInDcvjG/kFfr4XT5oWMSKvT0JvSlikaQ/8vS4W
         LQJ0l9rOfN6n0OrBJKQxx119sScchqe74/VjF7hcz3m1t5mYblIlE6MUV0+aO1cHtmXv
         IhdqW0w+TmtDXMTy/XFLV1IUB4Gb4iGSCMw4w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a linux box acting as a router/gateway between the internet, a
public network and a private LAN. We are using iptables to SNAT our
LAN. The setup for this is quite simple:

IPTABLES=`which iptables`
LAN=eth0
WAN=eth1
PUB=eth2
LAN_BLOCK=192.168.16.0/24
NAT_SOURCE=1.2.3.4

$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN -o $WAN -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -i $LAN -o $PUB -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -i $PUB -o $LAN -m state --state NEW -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o $WAN -s $LAN_BLOCK -j SNAT
--to-source $NAT_SOURCE

With these rules, I get great download performance, regardless of
protocol (sftp, ftp, http, etc).

Uploads, however, are a different story. I believe that the source of
this issue is the NATing because, if I upload to the same server from
a box that isn't being NATed (e.g. in the public block), upload speeds
are an order of magnitude greater when not being NATed, regardless of
protocol. For example, if I upload a file from one of our public
servers to a remote location, it will upload at about 500Kb/s. The
same upload to the same location with within the LAN won't see more
than 60Kb/s.

I'm not doing any kind of fancy traffic control or anything like that.
I would expect to see some slowdown because of the NAT (for example,
downloads are 600Kb/s vs 500Kb/s through the NAT), but this kind of
slowdown seems a bit ridiculous.

I'm running a custom 2.6.30.3 kernel.  I've also installed
conntrack-tools thinking that my connection table might be getting
full.  However, according to conntrack -S:

entries                 455
searched                84375
found                   10970723
new                     242106
invalid                 15039
ignore                  53722
delete                  241522
delete_list             225919
insert                  226270
insert_failed           0
drop                    0
early_drop              0
icmp_error              5741
expect_new              28
expect_create           43
expect_delete           34

So I am well below the table max:

# sysctl net.netfilter.nf_conntrack_max
net.netfilter.nf_conntrack_max = 65536

Is this kind of performance drop to be expected w/ netfilter and
iptables?  Any suggestions on things I can do to increase performance?
