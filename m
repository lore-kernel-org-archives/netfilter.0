From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: tool to search within cidr blocks
Date: Sun, 26 Oct 2008 22:13:09 +0100
Message-ID: <1814bfe70810261413tb4ca7c0ufaaf5a7de5e2ec0e@mail.gmail.com>
References: <Ack0fGqkMfM1syJxRQCXdIAkNZSCIQ==>
	 <004301c9347c$6ab0a3c0$4011eb40$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=r2wVOL05IwZB4n98SvQQycRzLXN6voiqXAO4FtrnB2k=;
        b=pW1/4FA1VN8OIYhVvaI7oIL+eZTxAmbXe2V7nP182aWFDjnf8m/km21jlAYLrKn4iA
         lV8QnXwIXtXXyPhZWXfyGf5FdZxETD/MCqSYdIIRcXwr6dhU3mvbB+oHQV2+1+Gk78RE
         yVhLds+rjG5JoyFksj/U356GOxfqr0KjoFFRM=
In-Reply-To: <004301c9347c$6ab0a3c0$4011eb40$@net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joey <Joey@web56.net>
Cc: IPTables <netfilter@vger.kernel.org>

Hi,

I took a look into mails related to this, and maybe you can use geoip
iptables patch ....

here is how it is implemented on debian :
http://www.debian-administration.org/articles/518

I try and tested this solution it works fine and very fast.

Kind regards,

Elvir Kuric

On Wed, Oct 22, 2008 at 8:28 PM, Joey <Joey@web56.net> wrote:
> Hello,
>
> I have several ranges of IP's being put into iptables.
> The IP ranges look like this:
> 62.29.0.0/17
> 62.68.192.0/19
> 62.108.64.0/19
> 62.244.192.0/18
> 62.248.0.0/17
> 77.67.128.0/17
> 77.72.184.0/21
> 77.73.216.0/21
> 77.75.32.0/21
> 77.75.216.0/21
> 77.79.64.0/18
> 77.92.0.0/19
> 77.92.96.0/19
> 77.92.128.0/19
> 77.223.128.0/19
> 77.245.144.0/20
> 78.40.224.0/21
> 78.111.96.0/20
> 78.135.0.0/17
>
>
> I am blocking a specific IP from the firewall as logged in messages
> 71.74.56.125.
> In looking at each block of ip's and using a CIDR calculator I can't figure
> out what range it's really coming from.  The list I have is pretty huge.
> Is there a tool or a way to ask iptables what rule it matches?  Based on all
> my calculations I don't have anything declared that would block that IP.
>
> Thanks!
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
