From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Rules For MailServer
Date: Mon, 4 Aug 2008 09:28:48 +0200
Message-ID: <1CFE53EEA31442FC85BD82BF7044BAB3@dcyb.net>
References: <000001c8f5e7$4cfe8be0$e6fba3a0$@info> <650807.79359.qm@web94006.mail.in2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <650807.79359.qm@web94006.mail.in2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Yes, using RBLSMTPD there are zen,spamcop & another 2
> RBL sites i have been configured. even though the lots
> of unwanted connection is established...

Yes, well, you can rate-limit smtp connections, but since you probably can't
know where legitimate email comes from, you'll also be limiting legitimate
connections. However, maybe Qmail can rate-limit smtp connections too in a
nicer way (I don't know Qmail, but I know that Postfix has a "stress" config
these days).

You can try using the limit match:
$ipt -A INPUT -i eth1 -m state --state NEW -p tcp --dport 25 \
  -m limit --limit 1/second -j ACCEPT
$ipt -A INPUT -i eth1 -m state --state NEW -p tcp --dport 25 \
  -j REJECT

Or using the connlimit match:
$ipt -A INPUT -i eth1 -m state --state NEW -p tcp --dport 25 \
  -m connlimit --connlimit-above 2 -j REJECT

They do different things, but one of them may be useful for you.
See "man iptables".


Grts,
Rob

-- 
Disclaimer:
Any errors in spelling, tact or fact are transmission errors.


