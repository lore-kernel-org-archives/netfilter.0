From: Angel Inkov <bl8cki@gmail.com>
Subject: ebtables nflog problem
Date: Wed, 11 Aug 2010 16:56:13 +0300
Message-ID: <AANLkTin1gZF1ofnJK5kdb5+fvpqZkqomC+x=eRCi7sX1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=G0pYAqtSKyJRHxqMki52jzRJCr6nyPAnjDqXdZ7HfQQ=;
        b=cQyJNI3QMjTDDi/zNdGItAkekCamdUui/JzE/9aV2jllmfXv++++EdJ800ATQkhdAz
         Z+LF2JjyQLdj4EIFIRTQ6GHzd1ROH0IitA/KdM8x+mEVBWA2qUEZJo9lWC59jMhuQUS5
         BUVoCRj1msCAQ0wAkhL9j9oFZMzsMUfHnp+h0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have compiled libnetfilter_log (make; make check) and from there I'm
using nfulnl_test utility with little modification to bind
on group 1 (qh = nflog_bind_group(h, 1)), which as I understand dumps
some information for arriving packets.

After that with rule such:

'iptables -t filter -A OUTPUT -p IP -d 192.168.1.1 -j NFLOG --nflog-group 1'

I successfully see packet information with nfulnl_test when execute
'ping 192.168.1.1'

When I want to do the same thing with ebtables with rule:

'ebtables -t filter -A OUTPUT -p IP --ip-dst 192.168.1.1 --nflog-group
1 -j ACCEPT'

I can not see anything. When I check if the rule is matching with
'ebtables -L --Lc' everything seems ok,
counters increment.

Am I missing something?

Is there some other way I can check if ebtables nflog functionality is
working properly?
Maybe the problem is in nfulnl_test utility, which works only for iptables?

Thanks for your help!
