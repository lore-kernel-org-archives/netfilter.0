From: Brian Filipek <bfilipek@betterworldbooks.com>
Subject: TCP flags syntax in nftables
Date: Thu, 23 Mar 2017 08:11:12 -0400
Message-ID: <CAJRbyBz+ujYaTFbTAMnWnNXcO061upw7-f34BuDnirMzvRkmmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=betterworldbooks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=Mw+Kc3WbKPioVhV9tYB1Vc1W4VyiihzWD80tEM8Z7ns=;
        b=HAxEggH3uhqX96Dti85uYOzZGPCN0l2OOqcBN8p+pQQnYQZVg5lt+1FFJYTuTF3Mt5
         ETgrw248HmgGI5ve/xRE7X8xmZpoVVBZz/GR6Jyso71e6wPgzsrBLASaT0NhS4Zg1Ogh
         p7DxDtkGyf7A4mBOfuy1UIH45QIdkJ3fSZqH1EGcV32wL5YJFOfOiRe2PoG23MZPbJ/B
         ZnKkCj1KmEZAtuuxVKyeA/ns1vPnhypF02igUw2WjYikV8ILd2Q4GClQvHQGQUirj97v
         HkYPfbuDrLGypdm2ggeUl0Yz5968WRae/AtHe3yLqESlblurWaC0V9a9zaPPe4GWXFQP
         NIyg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I've done some digging but really can't find a good explanation of the
syntax for matching TCP flags in nftables. In iptables a rule can be
written like:
-A TEST_BADFLAGS -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOG_BADFLAGS

How do I do the equivalent in nftables? Also are we still able to use
the "ALL" and "NONE" keywords?

Thanks!
