From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: filtering based on MAC address prefix
Date: Sat, 16 Jan 2010 11:55:54 +0200
Message-ID: <4B518D2A.2040905@caf.com.tr>
References: <818423da1001151144m5d7b698dh2c7ed2a108a0489c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=caf.com.tr; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:references:subject:subject:mime-version:user-agent:from:from
	:date:date:message-id:received:received; s=originating; t=
	1263635762; bh=b0oRAdI2RPHq1NVqESwgucxZdYjR3laqIUNP/UqKWUk=; b=o
	qpqhpCdyuNVJW7+QY2mAvQm4Mq4nSTKzXXmWmSC1oD+g29HYBV0j4ISg80o+aDxe
	3dwlxquwEs4CNxgL/seUS7n29/8QNCeYfTvugV044kG2eXg5Ysq1B9Chnj7rUskr
	PxhB1wB9WkNYfJfLN51m6LY8OFbwmUONeFWTIfIZrY=
In-Reply-To: <818423da1001151144m5d7b698dh2c7ed2a108a0489c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Drake <dsd@laptop.org>
Cc: netfilter@vger.kernel.org

On 15.01.2010 21:44, Daniel Drake wrote:
> I'm interested in setting up iptables filtering rules based on the OUI
> (i.e. first 3 bytes) of the source MAC address. Is this possible?
> 
> I see that there is a "mac" match extension but it only seems to
> operate with full 6-byte addresses. I also looked at the u32 extension
> but that only seems to operate on the TCP header, not on the ethernet
> header.
> 
> Any ideas/suggestions?

ebtables(8) is usually the better tool to use for dealing with ethernet
frames.  Check if its --source and among matches fits.

-- 
Eray
