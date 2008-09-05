From: "Yury Batrakov" <batrakov@gmail.com>
Subject: Question about conntrack
Date: Fri, 5 Sep 2008 16:31:02 +0400
Message-ID: <786c7f0809050531s1a12b40au8c7b2c9387f9b055@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=JsUz2NbOXyEoINn7Wa7LKsULS7l+9zZzOwBxmDWf5bU=;
        b=MkjIWJH9WwiM3aIMKe13llpf40fdyv62qTy9Bzhfg5JBO3iozRgN25MGypPKq1T+wL
         CaBaSHakiy+oyloq06jf14ExTK99pr1TGyUE5Pc+Cyf8n2BDz9xpIb2KubcTmGHb3TcU
         NIKE5JK3NORjFIJlv8AYxrPhDCK7nGmtEH8K4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all!

I've got a couple of questiona about netfilter's connection tracker,
could someone clarify it to me?
1. When conntrack is being flushed? In /proc/net/ip_conntrack I see
lots of UNREPLIED connections, I reload conntrack kernel module but
see the table being filled with old entries. The same looks to happen
after rebooting Linux box.
2. Are UNREPLIED connections being wiped when number of connections to
track equals to conntrack's capacity? Some web resources tell they
are, but some tell otherwise. I tried to reduce conntrack's capacity
and saw that these connections aren't wiped and cause conntrack to
overflow is it bug or feature?
3. I played with NOTRACK target of table raw and discovered that if I
add a NOTRACK rule that matches with already established connections,
they stuck in table as unreplied. Most of them disappear when I set
net.ipv4.netfilter.ip_conntrack_tcp_loose to 0. Is it recommended to
kill existing unreplied connections in this way? Could it be any side
effect for new or currently established connections that don't match
NOTRACK?

Thanks in advance
