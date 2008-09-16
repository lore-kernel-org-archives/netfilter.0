From: Vimal <j.vimal@gmail.com>
Subject: Re: Https website is not accessible once transparent proxy is set up
Date: Tue, 16 Sep 2008 23:31:47 +0530
Message-ID: <ff71fbf20809161101r772b3280vcbb6e49fa42a11c6@mail.gmail.com>
References: <A42989E6EE1BCE4C9C1FF7DE428FF3C6630F@mos-exchange.mosmsg.com.sg>
	 <18b30431bfdfb986412e296c4bc9aad1.squirrel@www.arcoscom.com>
	 <48CF9644.7010504@oracle.com>
	 <fb6debad85eb3106cd197c989db6027c.squirrel@www.arcoscom.com>
	 <48CFB994.1060404@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=iirp0Bjky2jQzTD5DVjRcFPFVQQsy0icdNWjQP4D/+A=;
        b=UEL2uzr9b6yGJLBtEdEhqC/ZIFwpY/CsK50kYGJnJtPI8wDskCbCix3wtJvl3DwnzO
         9n3s9MKdzbp9MB+DaWR/tdLJB0o+GbyAG17B61BIVTKOvGvsTGD5SJEXQINOJ0FHqFtK
         zzcNyS+sNpKyxh0aO6eV9/CVxwg/6+9z/GxdI=
In-Reply-To: <48CFB994.1060404@oracle.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Haxby <john.haxby@oracle.com>
Cc: linux@arcoscom.com, netfilter@vger.kernel.org

>   struct sockaddr_in sin;
>   socklen_t len = sizeof(sin);
>   getsockopt (sock, SOL_IP, SO_ORIGINAL_DST, &sin, &len);
>   sprintf(buf, "CONNECT %s:%d HTTP/1.0\r\n\r\n",
>          inet_ntoa(sin.sin_addr), ntohs(sin.sin_port));
>

The idea is wonderful.

> I can't remember if I found this by grepping the squid source code or from a
> different web proxy.  I really must find the time to pretty up my program
> (and remove the bug that makes it crash from time to time) so I can publish
> it somewhere for general consumption.   It saves having to configure
> world+dog to use a proxy.

This is something similar to what applications like: tsocks and
transconnect do. But, they work at the client side.

But, can one setup a NAT server that does the appropriate forwarding
for https connections? This would look like there is a transparent
proxy setup.

Apologies, if the thread actually talks about the above mentioned stuff ... :)

-- 
Vimal
