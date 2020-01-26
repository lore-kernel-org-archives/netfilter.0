From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Bulk loading of IP addresses or subnets in nftables?
Date: Sun, 26 Jan 2020 06:18:59 +0200
Message-ID: <8856312f-553c-f751-bd0b-aa230fda6d11@gmx.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580012340;
        bh=KtarYwz99siSyK/QkXKVuhih00OfwPco7X8Ai0x/sDI=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=bK5HOCtwlCLP9P2XuYvHOTsPjygzxGwYvSGr4BCQZJP4Kjj/qsYoL9ebuAvGocKJm
         Y3bq8h1OTxlTmVu1QUSjuH1v9x5Riazay37gkYp73ncSKvTalLWoJACC0kC1hFA+YO
         styCqqv+3/arLKrSHnD1+UlmQiqS1ntkTxk/aoOE=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

In nftables, I'd like to apply a rule or set of rules to a very large
number of IP addresses and subnets and looking for the recommended best
practices for that: Should I make a new chain with one address or subnet
per rule, should I use a dictionary, or should I try using a set, or
does it matter?  The list would be read at boot but not usually updated
much between boots.  Which method would operate most efficiently once
the addresses and subnets are loaded?

/Lars
