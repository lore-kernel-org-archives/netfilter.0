From: aikipooh@gmail.com (=?utf-8?B?0K7RgNC40Lkg0J/Rg9GF0LDQu9GM0YHQutC4?=
	=?utf-8?B?0Lk=?=)
Subject: Mangling packets & routing in kernels>3.17
Date: Thu, 04 Jun 2015 21:47:26 +0300
Message-ID: <87h9qnz4xt.fsf@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=PAKUyafBfPHsr5dEc4/VvcYShJhA0Yp6wCMnqq4vHFU=;
        b=BHXUbgeZoevE7O9I2pQtavpLoGp8yuCI0btrEjkToHJnQ/bKGOnVYX4SdEZJlrdvP0
         9ax1agxbslt1lmdH0dup53DsnH9AvHNSllrCmrfGOqeAcsBngnY5UdzDYGmixota0GSE
         turwZ1WdWoxALTqYgjsWr9E4E84W25xj/G59LCermuhudt+dzrlG0g5TRH9scc7O+jeN
         QAdbF0oRQJWDs+pibq/qyehGgaZS6seT2Zu3yMh/3U/YQzMjsUe3qzL3VKHY1lOHYHpR
         1P1qnKjhDhLkWRT5o6TK8RoVa6AexZOmTyyF4kSHUGgg/X5wSKXftXOhDKEUss+tE0oz
         q+yQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have an application and an iptables kernel module to change src/dst addr/port of the packets going from different interfaces. Application uses libnetfilter_queue. It worked ok with 3.17.2 (embedded gentoo) where kernel module works and also on 3.14 on regular linux where libnetfilter application works. After I've upgraded to 3.18 both stopped working. The packet comes, I change addresses and ports and don't see it coming out. I've tried to route it manually in kernel module but it didn't help.
Locally originated packets were mangled and sent out correctly with the module. So it must be something with the forwarding/routing part probably.

Can you think of any changes between 3.17 and 3.18 that could have broken it?
