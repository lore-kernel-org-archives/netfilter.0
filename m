From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: vlan client connecting to a bridge host
Date: Wed, 24 Aug 2011 03:48:09 -0700 (PDT)
Message-ID: <1314182889.50585.YahooMailClassic@web161421.mail.bf1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1314182889; bh=3eLtGIeloXV6h2Nl3NZAxqDKzMsqza1WbMZxmp+SHkQ=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Subject:To:MIME-Version:Content-Type; b=JwNRqMIw+QVqnCvqYvc57gP6RdWeeDVWeOmncuTKdQepjkN0wL6s7Sy16JZZrHS5UaAK8BDOEb4fxQCH+G876w3F85GDGE3I5cH+UaZNSErXVOB/WR2dp0JvGyZ23wmuCEEAa/feTRG8cEaKtLKkiI2m1Xm6V/kzF47/VirU8BY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have set up a simple bridge, host A :-

   # brctl addbr br0
   # brctl addif br0 eth0
   # brctl addif br0 eth1
   # ifconfig br0 192.168.1.1 up

Then on both sides of the bridges, I have many computers on different VLANs. For example, on eth0 side, I have host B:-

   # vconfig add eth0 100
   # ifconfig eth0.100 192.168.1.2 up

And on the eth1 side, I have host C:-
   
   # vconfig add eth0 100
   # ifconfig eth0.100 192.168.1.3 up

Then host B can connect to host C without any problem and vice versa. But I want to also host B to able able to connect to the bridge host A.

Is there a way I can accomplish this by using ebtables/brctl/iptables ?


