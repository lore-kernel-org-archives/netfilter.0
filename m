From: Filippo Zeus <filippozeus@gmail.com>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Mon, 26 May 2008 21:24:14 +0200
Message-ID: <483B0E5E.4010209@gmail.com>
Reply-To: filippozeus@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:disposition-notification-to:date:from:reply-to:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
        bh=7dO1rPpjI9/2ysJB2BdL7hiUyzdVZ/QM0cFMMhkj314=;
        b=ryKUaLRsROwmXqgcvsM+4LiXh8KDGWir9ApblKnpZgrZwByAd09WK1GQ+HvTyjWYatl7hGtDkKbro7W5vPYOgXefWaeN0bQ6wjfPEsM8lQnziCPWvyovrCtLe3PUDla2QeXNjw5uLieLazxV0eeRonbtCNSUtqxQSnVJwRmMccY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

That's true ... proftpd has been configured to encrypt auth+data
so the PORT command is sent in cleartext way.

I you read
question Using mod_tls, FTP sessions through my firewall now no longer 
work. What's going on?
at http://www.castaglia.org/proftpd/doc/contrib/ProFTPD-mini-HOWTO-TLS.html

proftpd developers suggest to do this to fix this problem...
but it do not work.

please help

> There's no bug, indeed.
> Conntrack helper simply *can't* see the PORT command, since the packet 
> payload
> is encrypted.
>
