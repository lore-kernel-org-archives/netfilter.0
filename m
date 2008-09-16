From: Vimal <j.vimal@gmail.com>
Subject: Re: iptables not prevent access
Date: Tue, 16 Sep 2008 07:19:33 +0530
Message-ID: <ff71fbf20809151849h1e32a937o9ad02051b387a012@mail.gmail.com>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <48CE466F.3030008@tech.nologi.es>
	 <D8C9BC7FFCF8154FB7141EB8DB609C17217260657C@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=rM15lNWn480nwb9bNT9ypEzPGAeIVlRqEwl1wcVJfQQ=;
        b=hXBrRy5yFh7Yk1SyX0sTIxkq2lQcbTMCW7PdAYvjw7KdLtkI15STWNPypthrJFcY0+
         9/6ryk5DqrnAwdrmE2xpZ9eVjuf4AUs0IpFhEXkjvBkSWXozC6blXswLdIobp63kbjAs
         j/+5/zbXSUSVl0fNQt5nXF6ZBxk7g+1ZiA3MA=
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C17217260657C@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Cc: Simon Gray <iptables@tech.nologi.es>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>
> The following is the output of the command. Anything wrong here?

These are the routing tables of the server, right?

Could you also post the routing tables from:
* the client from whom you were able to access
* The client from whom you _were NOT_ able to access


> 0x10003 ...00 50 8d 7e 51 29 ...... NVIDIA nForce Networking Controller - Virtual

Generally, one should comment out the last 3 bytes as they are
supposed to be unique :)

I hope that these routing tables are for the server
> Active Routes:
> Network Destination        Netmask          Gateway       Interface  Metric
>          0.0.0.0          0.0.0.0       13.121.8.1     13.121.8.119     20
>       13.121.8.0    255.255.255.0     13.121.8.119     13.121.8.119     20

I am not able to understand this routing entry. Why is the gateway
address the same as the computer? Is this equivalent to the * entry in
the output of the `route' command in Linux?

-- 
Vimal
