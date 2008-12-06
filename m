From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Ping in ESTABLISHED
Date: Sat, 6 Dec 2008 10:25:52 -0800
Message-ID: <493ac3bf.14098e0a.4085.ffffcfe1@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :mime-version:content-type:content-transfer-encoding:x-mailer
         :thread-index:content-language:message-id;
        bh=qlqmRr1KrzyZh6rjFza8QcyWvHmLuSv6quHOGSpTifM=;
        b=NGDdE43INr3YQhZ/z9yBjTWyxr1WXfEAi/eliXVBYlHrUSpzf97cs5W/g476vMxrIH
         a4/Xk7HyvB5fbCkd0VXkYcwk9uZIUc0nay0YwSvJ2jJ7b+5AD++Bg80aHPOIYTIHVfkv
         xZRAjkqY8XbA9N5trB0/dLZTzWNwwrDDtPygM=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a situation where a continuous ping, expected to create a new
connection each time, turns into a single connection in ESTABLISHED state

Here are the details:
- iptables runs on a bridge
- The bridge connects eth1 and eth2
- The iptables rules (minimized for the sake of this post)
    -A FORWARD -p icmp -m physdev  --physdev-in eth1 --physdev-is-bridged -j
ACCEPT
    -A FORWARD -p icmp -m state --state ESTABLISHED -j ACCEPT
    -A FORWARD -p icmp -m state --state NEW -j ACCEPT
    -A FORWARD -j ACCEPT
- A machine located on the eth2 network constantly sends a ping to a machine
located in eth1 network
- "iptables -L -v" shows the counters growing on rules #1 and #3. This is
expected.
- However, at some point, the counters start increasing on rule #2, and stop
increasing on rule #3. This can happen after 200 pings, 400, or even 3000 in
one overnight test.

Any idea what's going on ?


