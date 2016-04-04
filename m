From: Jack <jackzzjack@gmail.com>
Subject: iptables with DNAT target to multiple port range translation
Date: Mon, 4 Apr 2016 22:06:04 +0800
Message-ID: <CADZ=QZnaGDX6P49n95pOo7hQp-F8mP2QK9DJ8bqDj4jMqv8R=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=AtqfDH/J1WBfi411QVDMf7kLIoO9W+4c49su0w/lS9g=;
        b=N6kUDIqgIjidXCrEJkWV2PxawxodlfpVsW4w/Qt6aXRkBUeYlBnvIRjSjt/NpNNlov
         WQOMIXfp1vapfLVUh6BTsvgAvMIjPrlOeDbzyZlTrErhRZk4Bq3gvnIq8sQxYAlTGmGe
         1E66Ju1keP/92LWhgxHZNBoD2HQZ2lUKQ0jeavhk2W2Zmkj32nhE2wIAesKD3385LgYI
         iREGYb08xgc13fmqU4AUXbKpk8xaXLulBW0zSRXIlH3e34tpxfC6PJjoDZNM+Ykdgj59
         AQOJLW3oFiM5bMJBV1Dpn5hnoUbXoMLy54VkDi9bCvTkXhbJpSCMoeVeMjMVp+8Zqiog
         srTg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear all,

I want to use iptables to set DNAT target. The multi-port virtual
server is the purpose that I want to do. But I found that DNAT cannot
map multi-port to destination multi-port. e.g.

iptables -t nat -A PREROUTING -p tcp --dport 1000:2000 -j DNAT
--destination 192.168.1.100:3000-4000

I think this rule should be
1000 ------> 3000
1001 ------> 3001
...........................
2000 ------> 4000

I tried to use whireshark to capture packets. No matter original
packets are 1000, 1001, 2000 and so on, they seem translate to port
3000 only. That's wired the iptables only mapping many ports to one
port.

Any advise ?

Thanks.
