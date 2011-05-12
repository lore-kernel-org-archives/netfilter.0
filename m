From: Vieri <rentorbuy@yahoo.com>
Subject: conntrack does not display bytes and packets
Date: Wed, 11 May 2011 23:49:15 -0700 (PDT)
Message-ID: <163899.90731.qm@web113310.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1305182955; bh=IzTaa+XElAh4R2IZCcP7aB7OnUBsMtBVDzzBV4uOB8o=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=rhRxSS9xelip596QYzQ4U7IrmsE1oCc1cyRsC80hA3SZ4VatKOlfWKziobjyfuu7dQ/J6FD2+Oe5LzAZIb6a+qSpnd+5GUOZ9ZqYjqXoUY1KdggLYJ0c3JF+SnDuEpyjlDHg+vXwbbeixdokolmnk6cR6sCBtTFF33755YD4cRA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, 

Since I updated my kernel to 2.6.36 and 2.6.37, /proc/net/nf_conntrack and conntrack -L do NOT show "packets" and "bytes" even for ASSURED / REPLIED connections. 

It seems that both of these data (bytes and packets) have disappeared from conntrack/netfilter. 

Am I missing something? Is there an option somewhere to restore earlier behavior (previous kernels/netfilter would always display both bytes and packets)?

Example when opening google: 

ipv4     2 tcp      6 431999 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52531 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52531 [ASSURED] mark=0 secmark=0 use=2 

ipv4     2 tcp      6 431999 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52533 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52533 [ASSURED] mark=0 secmark=0 use=2 

ipv4     2 tcp      6 431999 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52530 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52530 [ASSURED] mark=0 secmark=0 use=2 

ipv4     2 tcp      6 431998 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52532 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52532 [ASSURED] mark=0 secmark=0 use=2 

Previous kernel/netfilter would show something like this: 

tcp      6 73 TIME_WAIT src=10.215.144.7 dst=209.85.147.104 sport=35407 dport=80 packets=15 bytes=1386 src=209.85.147.104 dst=192.168.92.2 sport=80 dport=35407 packets=11 bytes=10180 [ASSURED] mark=1 use=1 

(note "bytes" and "packets") 

Thanks, 

Vieri


