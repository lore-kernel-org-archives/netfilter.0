From: Andrew Beverley <andy@andybev.com>
Subject: Re: connlimit troubles and questions
Date: Wed, 19 Sep 2012 21:00:48 +0100
Message-ID: <1348084848.4663.62.camel@andrew-desktop>
References: <20120919185526.M10579@todhackett.com>
	 <1348084413.4663.61.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1348084413.4663.61.camel@andrew-desktop>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1348084851;
	bh=xT7Fn/U0jjoc0VSY+a2/WaaASO/azHgAQQLOnQb8gPY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=i7JYlOcpjBmGG31fo1Jcds44YxySm+2xvxk/BnCqr2RhwAKByehiVSdKLTy4ONRzK
	 Xl8vSjIhY++/M4knBe3QwVR7snRHsNZUExiBTp6As+MF7d8XICj6ehUmO20EsMUWNy
	 QWoUGa+g9mC89cM08OcAXYqApnS97W6rHriiMQsQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: me <todh@todhackett.com>
Cc: netfilter@vger.kernel.org

On Wed, 2012-09-19 at 20:53 +0100, Andrew Beverley wrote:
> The multipart match should do the trick. See man iptables.

Oops. I meant multiport of course.

Andy


