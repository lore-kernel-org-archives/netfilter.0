From: Marco Padovan <evcz@evcz.tk>
Subject: xt_hashlimit: max count of 8192 reached
Date: Sun, 18 Nov 2012 17:45:42 +0100
Message-ID: <50A910B6.4000607@evcz.tk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :x-enigmail-version:openpgp:content-type:content-transfer-encoding;
        bh=D70o4HQqkGMgXnO76eM8QgcDp7pgIwULz3ycg9JKzJs=;
        b=IqSkuy877JCd1MN3nRVDFn+kIOlEZTB0WKm88L2xrTAuyuhv+QXMZY0gDbaSz8+xtx
         KEx2Y2LpTqFo7hRMS+xmc/doZGYYi01kob4jJ01GnJ9uh+aAFFiXtZyKGbpxH7qn7XUc
         Nk6IoeIO7FLkwBgrM2f2MmPctm9GbNof311wg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

I'm using this ruleon iptables v1.4.7


iptables -A INSYNSRCLIMITER -m hashlimit --hashlimit-htable-expire 10000
--hashlimit-htable-size 8192 --hashlimit-htable-max 8192
--hashlimit-mode srcip --hashlimit-name insynlimiter --hashlimit 1/s
--hashlimit-burst 25 -j RETURN


while being "synflooded" and I'm seeing a lot of

xt_hashlimit: max count of 8192 reached

errors logged... really a lot (just to explain how many of those: got a
bunch of "net_ratelimit: 42695 callbacks suppressed"logged too...)

What does exactly that errors mean?

did there was more then 8192 srcip to track and hashlimit went in
overflow or am I using --hashlimit-htable-size and
--hashlimit-htable-max in the wrong way?
