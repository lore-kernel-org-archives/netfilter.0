From: Karthikeyan Vinayagam <vkarthik@yahoo.com>
Subject: Conntrack-tool error -  undefined symbol: nfct_filter_dump_create
Date: Wed, 7 Nov 2012 00:25:26 -0800 (PST)
Message-ID: <1352276726.31157.YahooMailRC@web184806.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1352276726; bh=/vZV147UDtqsesORgDbxBl1wzU7YotNvetksZ5dLHBc=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Subject:To:MIME-Version:Content-Type; b=tJdBU4QkPACdnNXVlBGoqCFmuzb33YmPGfTE3cTwzH+wvGrCFG1/txlAHaaQEZvGFp6fQ6rYo1Qcn/3zPAQtO/SorCW/7WGi4Bjyv4MWJRVN2YSv8eqRbljXZJAeKIdeiu7hJUlsxwvYsg9rYNYYFLXxTbduEjR3yqXufEhMwOU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am getting the following error while running conntrack, this is under 
under  ubuntu 12.04 (3.2.0-30-generic-pae), compiling latest of 
libnetfilter_conntrack 1.02, conntrack_tools 1.4

conntrack: symbol lookup error: conntrack: undefined symbol: 
nfct_filter_dump_create

ld_debug shows :

$conntrack -L
      3197:
      3197:file=libnetfilter_conntrack.so.3 [0];  needed by conntrack [0]
      3197:file=libnetfilter_conntrack.so.3 [0];  generating link map
      3197:  dynamic: 0xb76e0ee0  base: 0xb76cc000   size: 0x000150d0
      3197:    entry: 0xb76ce6b0  phdr: 0xb76cc034  phnum:          7
      3197:
      3197:
      3197:file=libmnl.so.0 [0];  needed by conntrack [0]
      3197:file=libmnl.so.0 [0];  generating link map
      3197:  dynamic: 0xb76caf00  base: 0xb76c6000   size: 0x0000505c
      3197:    entry: 0xb76c7230  phdr: 0xb76c6034  phnum:          7
      3197:
      3197:
      3197:file=libnfnetlink.so.0 [0];  needed by conntrack [0]
      3197:file=libnfnetlink.so.0 [0];  generating link map
      3197:  dynamic: 0xb76c3f38  base: 0xb76bd000   size: 0x000070ac
      3197:    entry: 0xb76be250  phdr: 0xb76bd034  phnum:          7
      3197:
      3197:
      3197:file=libc.so.6 [0];  needed by conntrack [0]
      3197:file=libc.so.6 [0];  generating link map
      3197:  dynamic: 0xb76b8d7c  base: 0xb7518000   size: 0x001a4adc
      3197:    entry: 0xb7531630  phdr: 0xb7518034  phnum:         10
      3197:
      3197:
      3197:calling init: /lib/i386-linux-gnu/libc.so.6
      3197:
      3197:
      3197:calling init: /usr/lib/libmnl.so.0
      3197:
      3197:
      3197:initialize program: conntrack
      3197:
      3197:
      3197:transferring control: conntrack
      3197:
      3197:conntrack: error: symbol lookup error: undefined symbol: 
nfct_filter_dump_create (fatal)
conntrack: symbol lookup error: conntrack: undefined symbol: 
nfct_filter_dump_create
:~$ 

