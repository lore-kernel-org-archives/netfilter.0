From: Andrew Beverley <andy@andybev.com>
Subject: Re: how the packet is traversed
Date: Tue, 02 Oct 2012 21:54:39 +0100
Message-ID: <1349211279.4663.310.camel@andrew-desktop>
References: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1349211282;
	bh=ReCKCA9ys4YRqclcTPgES0+s5xY72BV8Wbo+72r4YPQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=qrLkhy+hxnyA5NqfjSX76p30wvbIsawJzGBo5MDoKx6maAXXlxoI6mvK+Br/kZDX0
	 LXpDCqnoY5VtEDDvHTvyyhabN+fS4hLXsCLxMGS6LKGEXFxcD6FJGxfYtEyLMQgT8B
	 bU3W2O8eOthVU3hCQlx7wcs1Aw8MOi+a759ZWDeQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giuseppe Longo <giuseppelng@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2012-10-02 at 22:20 +0200, Giuseppe Longo wrote:
> Hello,
> i'm a student of computer science, working on a project using iptables.
> I'm confused how the packet is treated when it's arrived in the iptables.
> 
> Someone can explain me this process?

Well there are various tutorials, none of which I can find right now,
but a picture paints a thousand words...

This diagram is a good place to start as it's simple, although probably
out of date:

http://www.docum.org/docum.org/kptd/

Once you've got your head around that, this is the fully comprehensive
one, but tougher for beginners:

http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg

If you've got any specific questions, then please ask!

Andy


