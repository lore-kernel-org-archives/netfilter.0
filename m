From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: tcp dump and DROP
Date: Thu, 25 Feb 2010 15:13:25 +0530
Message-ID: <cfeab66d1002250143q162340b7w8b36094d77bfca35@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=bKKh13M9EZBmpQ1B/REFQjD7FPnLzSOub42TmGYdv2g=;
        b=QxZxks039Zr5MTQwZ9IsCzbRs5Buy7iJpk3eZfmpXhXqppqOFrKSCSgWeWPt8zzsTG
         GVCmkoegEsyKKmxTax0xkA2/fLNdoyHEh9bPJz6yD7kE+cqUhrrEWz9dR0mQkOknwEzX
         5Pkx04nYj7xbvZ1dLaY/hzW6Nv5qZOtZbIIsg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

if i drop a packet using

             iptables -A INPUT -i eth0 -j DROP

Can i see those packets using    tcpdump -i eth0  ?

IF  i drop packets in FORWARD chain

                  iptables -A FORWARD -i etho -o eth1 -j DROP

can i see those packets in  tcpdump -i eth0 ?

Thanks,
Ratheesh
