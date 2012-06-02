From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [Announce] LARTC wiki available
Date: Sat, 02 Jun 2012 17:50:31 +0200
Message-ID: <1338652231.2760.1706.camel@edumazet-glaptop>
References: <4EFB3B2B.7060200@linuxsystems.it>
	 <4FC8F0E4.6060102@linuxsystems.it>
	 <8063b8e35d17fd072cbdc9908cf12519@njm.linuxwall.info>
	 <4FCA2545.60702@ukfsn.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:from:to:cc:in-reply-to:references:content-type:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=an0AkF4SfBBcFMoCVvhpibELeXjoP6mLyG1oVuD9YtI=;
        b=F3xFsExMIbx1VZOGCBUWjBweYxvvquC5oIlfceK9CtF9FJjUY/vZ2sqYVajWLCDn1o
         krXgAOFs+sxl00QmJT3WPNdpHZpbA8usrK+fWxXn+w6tbnvrweBBb/ICIcsO/kyhCb8K
         aE6VFflore13dibDlhup/s/nShSd3l/qsJvoWYnDHxnSy5XOEygdUJTGHlaJXDTReecB
         pcI9LvJPg34EpdLWh6EJVJb0rVoGKlClOcrkeC6vdkjZu24pVEsYtwJSDiv2Oc5WN1Fd
         vbLx815Y0TgEUJor84rFXA7ZdMtZnu+qaGhJcRcIT97T2u/dkk1GPvlMafMZfJMQeAEB
         0AzQ==
In-Reply-To: <4FCA2545.60702@ukfsn.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Furniss <andyqos@ukfsn.org>
Cc: Julien Vehent <julien@linuxwall.info>, =?ISO-8859-1?Q?Niccol=F2?= Belli <darkbasic@linuxsystems.it>, lartc@vger.kernel.org, netfilter@vger.kernel.org, Linux Networking Developer Mailing List <netdev@vger.kernel.org>

On Sat, 2012-06-02 at 15:37 +0100, Andy Furniss wrote:

> 
> Anyway it seems that early this year SFQ got some love and now has 
> several more options (red, headdrop, limit >127, depth as param) - so as 
> long as your iproute/kernel is current have a look at man tc-sfq for 
> details.

Yes, but fq_codel is really better than SFQ.

