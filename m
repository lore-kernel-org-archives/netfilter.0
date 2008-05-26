From: Filippo Zeus <filippozeus@gmail.com>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Mon, 26 May 2008 22:00:55 +0200
Message-ID: <483B16F7.2010205@gmail.com>
References: <483B0E5E.4010209@gmail.com> <483B11DF.3050904@bofhland.org>
Reply-To: filippozeus@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:disposition-notification-to:date:from:reply-to:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=GCshnsWIpjgUnjQIHd6iWikweK4hM56RAPKrq6hXomw=;
        b=XHYFEtceFVO8zeK5t1AQxoQ1nzXk/8p6+83M8GnebJ79I9Or7mQLSNKpLSNl6UU9jn7zHMMeRJvd9TvAWU47ERcBtwKNycz+m7c+oD4X/6Vor0PjDSdsevY/TT66r+USTNP5MoKLUHy00+F3x/3jAuG+RyDMAF2x2m1xez/vOVc=
In-Reply-To: <483B11DF.3050904@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

thanks for your help at first !

yes. and i've tested tons of clients (ftp-ssl, filezilla, hated M$-IE).
unfortunatly tcpdump has confirmed my prefeeling.
Also, reading at proftpd log i can see that encrypted channel is 
switched off after PASS command
and stay on only for the data channel.

I'm not shure, cause i'm not a developer, but i think that ftp_conntrak 
module open a port *ONLY* if
it read first the USER command, then the PASS command, then PASV/PORT 
commands
not simply if a (cleartext) PORT command came from the ftp client.


> Did you verify, by using for example tcpdump, that th client is 
> actually using
> CCC, sending commands in clear text?
>
