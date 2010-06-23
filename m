From: Florian Effenberger <floeff@gmail.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 10:53:19 +0200
Message-ID: <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:content-type:mime-version
         :subject:from:in-reply-to:date:content-transfer-encoding:message-id
         :references:to:x-mailer;
        bh=Td6fCaHzONw3KfNhGXYEIsiaWFf5ybhPIhEKkqPm4mw=;
        b=eVp63slodTYkSALOMH7++zhA6HliW4pRpllTVyuPKUuVYR++U9lMmQ00qZwfS+Pcl7
         THOMr563hBb8LPkFpv2A9FJIUjMGonpkaxfYMEWXgQux8l11KwNAElCFEVu8/1wpWWAn
         X1QQMwO3ufXcK/ftUv9pORmYl7LE7cGHdQptQ=
In-Reply-To: <4C210C24.9050605@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Lars,

Am 22.06.2010 um 21:16 schrieb Lars Nooden:

the same Lars Nooden as from the OOo mailing lists? If so: It's a small world. ;-)

> The chain is a drop-through list of ip addresses that you have decided are good.  Then make a rule or pair of rules to send tcp traffic for port 993 and port 537 to that user-defined chain.

If I run a script every 60 seconds per cron and add the hostname, it will automatically add all IPs returned by the DNS at that time. However, this changes randomly, and change time is not predictable.

If I add ten times the host and it resolves to the same IP, iptables doesn't recognize that, and I have 10 similar rules. Is there any check for duplicates possible?

If not, how many entries can the table have before it gets sluggish and slow? If I add two rules every 60 seconds, that would make 120 per hour, 2880 per day. Is that too much, do I need to purge them before? I have no experience with large filtering tables...

Florian