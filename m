From: Petr Chmelar <chmelab@gmail.com>
Subject: How to make conntrack to process all packets?
Date: Tue, 09 Jul 2013 20:09:15 +0200
Message-ID: <51DC51CB.5050002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=1uSoGRxinwzrXlC5wIKMKcG8IZeZarA5/IM5TgFOJTQ=;
        b=h9K7mNrnrTllQXrbGi4FWpcgasNA3AS+zIa/NS/URMiCmEsBOAVJpjLcm+S/MSe1Ae
         b7I9yMn8it7oPd9xs8MVZW2GWwMFa5gL4XvZkz6EGPGdOIRUU+KPCB91pyRVe8wqic54
         O+1olZ8qwKEL7je4/YmR4aztiBTOOj9iv/njAqnlOFsQT/P9MfnzxfD9zCOFtPH4h/hg
         2OsUBSUcB4HByMiOa6D4+1xJKj+WpsPHIUAdg0IarWMQJzDVUjK2RanNu0E7gQLcsGUg
         CWxAjBrLmZqm5vipdXBFmKbvQXZHNywCchYsdajYR8w6bZWb58zDJoXaEIvD9kQNLpNw
         bCyQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi there,

We would like to use Ulogd's NFCT input for intelligent netflow-based 
statistics reporting. The problem is that the netfilter_conntrack 
doesn't process connections that don't go through the system (we have 
noticed and found in man conntrack /TABLES), which we need to process 
because of sniffing in promisc mode (we have forwarded traffic from 
different vlans). This doesn't work even when we do something like:
iptables -I PREROUTING -i eth9.10 -t raw -j CT

In fact we're looking for an opposite of NOTRACK. Do you have any idea 
how to setup or recompile the libnetfilter_conntrack or similar (ulogd2) 
so we get also flows not destined for the system?

Thank you, Petr
