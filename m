From: Thomas Weberstaedt <thomas.weberstaedt@nebelschwaden.de>
Subject: nftables: defining variables containing ipv6 adresses
Date: Thu, 21 May 2020 12:27:20 +0200
Message-ID: <20200521122720.3a6c264a@kaperfahrt.nebelschwaden.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am wondering, how may I define IPv6 variables?

The obvious idea:

define IP6PREFIX = fdaa:bbbb:cccc:dddd

produces an error:

/etc/nftables/setup.conf:7:29-29: Error: syntax error,
unexpected colon, expecting newline or semicolon

define IP6PREFIX = fdaa:bbbb:cccc:dddd
                            ^

What would be the proper way to do so? Any documentation on this?

Thanks

Ede
