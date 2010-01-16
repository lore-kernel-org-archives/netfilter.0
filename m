From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: filtering based on MAC address prefix
Date: Sat, 16 Jan 2010 19:10:16 +0200
Message-ID: <4B51F2F8.5040704@caf.com.tr>
References: <818423da1001151144m5d7b698dh2c7ed2a108a0489c@mail.gmail.com>	 <4B518D2A.2040905@caf.com.tr> <818423da1001160837w64e17f52y1958260aaca80155@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=caf.com.tr; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:references:subject:subject:mime-version:user-agent:from:from
	:date:date:message-id:received:received; s=originating; t=
	1263661819; bh=BE6QPWgUJrgm/5kEFnCJt1uS9RM+fWl+Vxy6izq/pMU=; b=O
	iWWZrMlZlMByd3nnHqE0agQNXmCcrckmrAIv9ykXpALdh++FXwuNAfahkT+1F5D5
	oJ413sXb4SXbSiAuQh2JukkqHRbOs1Qk+339ql1gHfKMph0IeL7GGDY5V2YlgG7c
	s0yJNBwh9jKIyxpxk6xW3MAi7YD4De4FWrmxaLJpvM=
In-Reply-To: <818423da1001160837w64e17f52y1958260aaca80155@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Drake <dsd@laptop.org>
Cc: netfilter@vger.kernel.org

On 16.01.2010 18:37, Daniel Drake wrote:
> At first glance it looks ideal, but after trying to get it working, it
> seems inappropriate.
> Setting all ebtables policies to DROP (and adding log rules) does
> nothing. As far as I can tell, ebtables only operates on bridge
> devices, of which there are none in this setup. Am I missing anything?

Create a bridge with only one enslaved device and ebtables should see
the traffic:
http://ebtables.sourceforge.net/examples/basic.html#ex_nobridge

-- 
Eray
