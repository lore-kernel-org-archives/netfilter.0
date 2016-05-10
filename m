From: Ricardo Fraile <rfraile@idealista.com>
Subject: NOTRACK equivalent
Date: Tue, 10 May 2016 10:43:19 +0200
Message-ID: <1462869799.1641.3.camel@idealista.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idealistaA82505660.onmicrosoft.com; s=selector1-idealista-com;
 h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qlhuvj5yFQbrlipYwQAG04wYiqvSTEuSCqTjZJZkxF8=;
 b=iHxGf93yf+be8T7sNotQ1MgXVLc62coTypyWcqlyjji1qM1C2AuXR5XmgR8Q1JL4wEytbEaz/t1oxqecFkijykznkC6a4tjn5QpkrnElLfzOxhzkHY7S8PWyw/YOrcp2rDuk4xGaavoY+5n9eJ+kV4KenfNXtqkA7AYsDhdDvFQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,


How is possible to avoid tracking in nft as its done in iptables with
NOTRACK?

For example:

iptables -t raw -I PREROUTING -j NOTRACK
iptables -t raw -I OUTPUT -j NOTRACK


Thanks,

