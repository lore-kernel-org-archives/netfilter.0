From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Fri, 10 Feb 2012 20:05:47 +0000
Message-ID: <1328904347.18690.264.camel@andrew-desktop>
References: <22755605.2952.1328898963472.JavaMail.root@ixer.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <22755605.2952.1328898963472.JavaMail.root@ixer.mx>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328904350;
	bh=HEIVdSeqNcwzS7iNv5oou5IZ8a72+zc+mPayikH+B50=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=UWs6Or+bV8diYF6fpXfp53J2HWEaaB0RJePABTL1+6+o63C60XKkjsanI2bf6YyZI
	 8OWxsLJl6ZEqrLMMOq9mI8h1FexGUFW4WGDChEyFzKDaMqvZIUIYdwteJgR/n0Y8VC
	 IkOwO4oueXSW0YeueGLaGRTC6ARy6rxa0yVr+HOo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ehuerta@ixer.mx
Cc: netfilter@vger.kernel.org

On Fri, 2012-02-10 at 12:36 -0600, Enrique Huerta de la Fuente wrote:
> iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
> 
> but it does not work.

Are you *sure* it's not working?

> 
> Any ideas?

Upgrade maybe? As said previously, it's always worked for me.

Andy


