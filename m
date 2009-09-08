From: Richard Horton <arimus.uk@googlemail.com>
Subject: Forgive me for a hardware related q
Date: Tue, 8 Sep 2009 10:24:07 +0100
Message-ID: <56378e320909080224i666d3be9vb03befbcc8b41a18@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=Kul0rThq+pmQamRTlcCtdZHivISEkhhX38vxidh6QX4=;
        b=WEpDSg1Pr+LwnJyvhAbIN+rgcrBhRVy6EfUtjx+G+dxCqQjSSSiyp/s8r7Wbyltsb2
         rlQEnAsQChmp1px/xgvkb50qgW+kXzQGVIfmAipL1du+Tun9kPQLKoApg0L7SQq2PVwP
         ejBsbftrcSjiLYwmNiJuxIoFY6MoJ3xKdEt1w=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Firstly, sorry about this as this probably isn't really the right
place to ask but given the range of experience on here it's as good as
any ;)

Secondly, does anyone know of a linux based ADSL router suitable for
use on a home network which meets the following needs:-

1. Full iptables implementation which lets me create my own rule set
rather than some limited subset from a web interface,
2. Allows create of tc profiles to provide qos. Probably using RED,
HTB,SFQ and PRIO/PFIFO queues, also will need iptables mangle to set
the DSCP markings.



-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
