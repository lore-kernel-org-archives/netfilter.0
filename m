From: Jacek Kowalski <jacek@jacekk.info>
Subject: nft snat with maps for port ranges?
Date: Thu, 17 Sep 2020 01:06:53 +0200
Message-ID: <5bf0d8af-d978-c517-6503-4c610357dc0c@jacekk.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk-info.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=H0zWVT4yodghxpH4lAMBEuvLEK1IthblcKR7C991LNM=;
        b=KhRhZ+AGJnbQ/daS0xMpUtwqLSV7RX5N94wl8Rfnz4bvO7SZuFjl547En5Nvmip5tR
         B8CBPgZlyEI3+02MmdvCPOhqswJpirJcE+T6sURgw/TpwLpJ4pTO9wWnrmSuTNtNrQsy
         tNMji3G7UxM9D+fXqJeRu6L7VSe2kdydOIUZl+tAE7HlkRD/WTTtgYXFLKjmvLOC6sen
         AIHueSmE+5pab+7R3nULwPnK8G9YezpEv+vG58gsxbg9KoWazf8oxfs4JBUp4wXq5+m7
         N+S8RB7Ily7H3Fe/EFGISJr+a5tmTjJKeTrWXQB4Y0rq1KT0JK16g1knmB6AFBqww/9M
         m58g==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I need to setup SNAT with static and predictable IP/port range
allocations for each client. In iptables this results in long list of
rules similar to:

-A POSTROUTING -p tcp -s 10.1.1.1 -j SNAT --to IP1:10000-10999
-A POSTROUTING -p tcp -s 10.1.1.2 -j SNAT --to IP2:10000-10999
-A POSTROUTING -p tcp -s 10.1.1.3 -j SNAT --to IP1:11000-11999
-A POSTROUTING -p tcp -s 10.1.1.4 -j SNAT --to IP2:11000-11999
...
(possibly with --random/--random-fully, separately for each protocol)

Is there any way to leverage nft maps to simplify such chain of rules?

As far as I can tell:

meta l4proto tcp snat to jhash ip saddr mod 2 map {
  0 : IP1,
  1 : IP2
} : ip saddr map {
  10.1.1.1 : 10000,
  10.1.1.2 : 10000,
  ...
} - ip saddr map {
  10.1.1.1 : 10999,
  10.1.1.2 : 10999,
  ...
}

does not work ("Error: syntax error, unexpected -, expecting newline or
semicolon").


Of course removing the part after the "-" makes it work, but it does not
solve the problem. Allocating a single port per IP is not ideal.


range_stmt_expr in src/parser_bison.y also does not make me feel
optimistic. It only parses "basic_stmt_expr" and as far as I can tell
map_stmt_expr are not part of this token.


Any ideas for accomplishing this task are welcome.

-- 
Best regards,
  Jacek Kowalski
