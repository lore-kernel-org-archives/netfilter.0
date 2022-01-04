From: Olivier <oza.4h07@gmail.com>
Subject: How to log NAT connections with nftables ?
Date: Tue, 4 Jan 2022 17:41:53 +0100
Message-ID: <CAPeT9jgLrpcstTQ-tQBM6HFbfPKHT3RcDNXFD50Pnv-nM9BZYg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=2eruh9/+vddMyWR5NgI/vMGQAn3QSJDv6YYM5+gCu04=;
        b=gp0/S9geeCjcj6DONovQA2CWUdMFVJK8wupT17j03ltf4zPa7Ugri679pGa2W9wsA2
         9/Wa4OVcHTHfdSTbmN/U9h0uX6T54DpMJT9PqAQlFGVIPRp2HdleG9aYukYf6ZzxzSvP
         NsL+HH3PwuvcB9UuBjMj9pQrro0hzg5QJuOc1bID5+29GQr+CJsqpis2vGZgQp5KrSbl
         haQZK33X69vkKTDHY58krKk8s06a1k7tyl/29H5ITZRfo3o1cmfJUL0JlLkMKrHJX/ob
         UvWcwsvxYMqFpF5XYbhtek9X7kWacc7rMdpWE/I/XzRJA0Mj5YKRUK6Zw58hOF8EIPjg
         GtQg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I've got a Debian Bullseye host acting as a gateway to the Internet.
It serves around 100 simultaneous end users for mainstream usage (web
surfing, email, You Tube, ...).

For compliance reasons, I need to log NAT connections ie:
a timestamp, a private IPv4:port, a NATed IPv4:port and a destination IPv4:port.

Upon request, given a timestamp, a NATed IPv4 and a port, I must be
able to find the corresponding  IPv4 and port.
I don't mind collecting data files with a shell script before
processing files somewhere else and pushing data into an SQL database
later on.
Data retention period is 1 year.

1. How can I best produce these logs with netfilter ?
What are your recommendations ?

2. From previous experience, is it worth the effort to remove DNS or
other traffic from such logs to save disk space ?

3. Does it make sense to use Netflow/IPfix to separate log production
from log consolidation and storage ?

Cheers
