From: Simion Onea <simionea@gmail.com>
Subject: Forwarding packets over the same LAN
Date: Mon, 13 Jul 2009 17:00:55 +0300
Message-ID: <1247493655.2316.104.camel@TestField.intranet.bem.md>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:content-type
         :date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=orfzUUBYT8LHMRAsnWNxPDZc//8RT6jQF6eCl8UbYto=;
        b=utGdh2QIux84ZiKIYx3kC9HxE6jCnFPtncLBdxHtdzgGJR/Vzj23y+mkkwgbfk/mEM
         lje+HtHFFy46CUlj1GbaH7+d3AWsXigtN3rm2KRDBHB2DM7X8unDafYsQXLkwbo6md0s
         6fW2fxaI7p91nS/0bXnNR+HghKkb9OOuCtxqM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!

I'm trying to forward connections from one host to another over the same
LAN using "iptables".

Here's a description of my configuration:
The first host has the IP address 172.20.1.245
The second has the IP address 172.20.1.254 and has a mail server
listening on port 25/tcp.

I would like to write a set of "iptables" rules for the first host so
that any other host connecting to port 10025 on 172.20.1.245 would be
redirected to port 25 on 172.20.1.254.

For example:
- host 172.20.1.10 connects to 172.20.1.245:10025
- 172.20.1.245 transparently forwards the connection to 172.20.1.254
- 172.20.1.10 then actually "talks" to 172.20.1.254:25 without even
knowing it.

Regards,
Simion.


