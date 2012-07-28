From: kay <kay.diam@gmail.com>
Subject: Re: Identify traffic coming from which bridge
Date: Sat, 28 Jul 2012 06:58:34 +0400
Message-ID: <CANaOheaLYwF7vgxT_feX_VwvG6jJ+WC5NowgAMnLZVPLL9cDdw@mail.gmail.com>
References: <1343284518.33961.YahooMailNeo@web124903.mail.ne1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=sEChSahj+PS5RTEl3iufYt3S7ZhsUxqeVghMHm0NWts=;
        b=HJor50YfMjKsVyioL09RuoFZvbBgbCiVs5g0TStC/UpLjwxw1m4FUZLBojCA6yht9M
         ZBMqcQFERDN2SG9LyM/jCksrMvmOLBrtTz9hTgV5cQ5Po/f6juaYE4sdIfXIX++SZSbZ
         lMbaangP5bXYvInJPUaYeDpULg3pr08IMCBSQBLyOQnxlEFE930f1xWtbgMyv0+YR+Z6
         CJ2lPf96Rhp7XyxxUkIMVBJVBknH6RAl32Qs2jiG1oMVi7HB14WpKbSuGol4E7O3pn0I
         dO81fDylZwWNinbAnT0SL1dO7oBxZDJIEaI6ey+u3dfJNjHsolCniEMLwZfFbv9pkRQ3
         H4iQ==
In-Reply-To: <1343284518.33961.YahooMailNeo@web124903.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Master Yoda =)

You can try to use "--mac-source" match in iptables, combine iptables
with ipset and get the following rules:

ipset create bridge_a_clients src hash:ip
ipset create bridge_b_clients src hash:ip

iptables -t raw -A PREROUTING  --mac-source "BRIDGE_A_MAC" -j SET
--add-set bridge_a_clients src
iptables -t raw -A PREROUTING  --mac-source "BRIDGE_B_MAC" -j SET
--add-set bridge_b_clients src

To view bridge_a_clients use:
ipset bridge_a_clients list

To view bridge_b_clients use:
ipset bridge_b_clients list

This is not optimal solution, but it should help you.

Regards!

2012/7/26 Ming-Ching Tiew <mctiew@yahoo.com>:
> When a client X is connected to the server, is there a way for the server to
> know client X is connected via which bridge ?
