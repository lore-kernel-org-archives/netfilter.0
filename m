From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 22:01:04 +0300
Message-ID: <e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <1247585686.1173.7.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=n3eGNZlf6gucX8IEBnEpEYKMWMOX0vrV5YBNNcwkkDU=;
        b=qlLWe+zfhs2bRg2w5fecrE9Wxm+Xmc3VmidQj2GW0xV1j6dZtc/Dmq0zCVuKoWu9bF
         4GM9eHkKjLR3eDYAHxBs1yww17A50wcc7N3eJO1tYCjUdanACeGZYOoz1v8ARq/mA6F/
         KW2KynfkLtXJyjHzPLsw3w7BerA6ucHvkEJ0A=
In-Reply-To: <1247585686.1173.7.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

2009/7/14 Thomas Jacob <jacob@internet24.de>:
> You need to switch on forwarding though, I guess that is what is
> missing. Otherwise your system will just drop the packet after
> the Prerouting changes.
>
> i.e : echo 1 > /proc/sys/net/ipv4/ip_forward
>
> I've just tried these rules for myself again, and they work nicely.

(sigh) forwarding is always on. It is enabled at boot time in /etc/sysctl.conf

Maybe I should examine more carefully the INPUT and FORWARD chains of
the filter table. They are configured to allow inbound traffic to port
10025 and to allow forwarding to port 25. Are there any other
requirements?

Is there any means to "debug" or to "see" how a packet traverses the
chains and tables?

Thanks!
