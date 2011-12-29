From: Andrew Beverley <andy@andybev.com>
Subject: Re: can't set default route for virtual interface
Date: Thu, 29 Dec 2011 15:39:53 +0000
Message-ID: <1325173193.11172.150.camel@steve-pc>
References: <op.v654qjz3x1lyi3@debiandesk2.net>
	 <1325029381.1672.38.camel@steve-pc>  <op.v66puobex1lyi3@debiandesk2.net>
	 <1325067714.1672.691.camel@steve-pc>  <4EFC4EA0.9010403@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325173195;
	bh=3bo03wDbNkl6KuFKDkh2r78J2AEfpivMfpspo3Re35Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=TJFSifR9hr8WAHE8Y9nxlVdkisGCVmk9pGtoWDtX9SWwxKDzV2abix7SCwLy7nktl
	 NmpsS6V2w8bdSeGiwMNYdaVA04PgLpgs7qLD9aWtpMIjSsxT2/Zn6o8RRkKXH1nkaA
	 47lAlv7bJ/LO7YmEOOh4ODbOd/IGzdl4taSIdhng=
In-Reply-To: <4EFC4EA0.9010403@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: Lloyd Standish <lloyd@crnatural.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 2011-12-30 at 00:27 +1300, Amos Jeffries wrote:
> On 28/12/2011 11:21 p.m., Andrew Beverley wrote:
> > On Tue, 2011-12-27 at 23:36 -0600, Lloyd Standish wrote:
> >>    I usually bring up interfaces with "ifup" when I can
> > Ah, therein lies an interesting situation. ifup is pretty old too, and
> > makes calls to the ifconfig command, which is a real pain. However,
> > unless someone tells me otherwise, I'm not aware of a replacement for
> > it.
> 
> That would be ...
> 
>    ip link set dev eth0 up
>    ip link set dev eth0 down

Yes :-)

Although that only really replaces the ifconfig part. It would be nice
to have a proper replacement for ifup/ifdown that does the rest of the
networking stuff, such as setting the ip address and calling scripts, as
is contained in /etc/network/interfaces. It'll also call pppd and so on
as well.

Andy


