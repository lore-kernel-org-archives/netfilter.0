From: Vimal <j.vimal@gmail.com>
Subject: Re: iptables not prevent access
Date: Mon, 15 Sep 2008 17:41:53 +0530
Message-ID: <ff71fbf20809150511g6db0b772o9ebf7fdf54325dac@mail.gmail.com>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062EC@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=G3MTB5lsdvKfJe7Rj7MXhymPP14ib9hAEMZllJH3mBg=;
        b=Tb3/wa0rN61bbx7NI+i6RiDoqXF/LHd7TjDxD6xd4Kp+HAjy/1hKIZMop5NVjKM9Sn
         Aw37jnMrgtOzNJgbkkhBo4Iuanjw1/r1Siz8m5nf0Ktom4Eo7H4dpLKv5r0TvEv2sBJ8
         QbbH6HQ7U3bhI/95uMorVgqDyp7g6URyHrDNI=
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C1721726062EC@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

[Screenshots]
Looks like nothing is wrong.

Another possibility is that your gateway's netmask isn't defined properly.

When you want to contact the server, the client issues an ARP request
to find out the Mac address of the destination, since the destination
is on the same network as the client (source). It is quite possible
that the gateway's netmask (something other than 255.255.255.0) makes
it respond to this ARP, thinking that it should route this packet to
the destination.

In fact, try this one too:

* From the client, access the webpage
* From the server, check the access logs, and see which IP had
accessed the particular webpage you did in the previous step.

The two should be equal.

But, what continues to baffle me is the fact that no requests were
coming from your client's ethernet interface!
-- 
Vimal
