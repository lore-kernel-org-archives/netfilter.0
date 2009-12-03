From: Dave Malhotra <davemalhotra@gmail.com>
Subject: SNAT on local interfaces?
Date: Thu, 3 Dec 2009 12:47:37 -0500
Message-ID: <bbade2c10912030947x5aca86eap8bcc9936e128c519@mail.gmail.com>
References: <bbade2c10912030945ufb7dd78rac68fbb3147cc08f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=BrCr3H7hcDwOxf+jPgu/DSh/J/EJZ9sVviPCvfkEfUY=;
        b=tH7WRhaXTcLU4Q4i6+JuYJV3xCVmT9k6J2ftNMMpAJvaX33tBnTv6VNwkeHJBfgeUa
         qEpIYeC7qMwLMd+FVgLLBTLBXiqrbG8TBxlxAU/Nr3q7VXaehXhFX4meW9tsmhmaz7qH
         vVZT2UaeXRDdjJI0Q8BiF/Gd13PJ+pjpTAhnc=
In-Reply-To: <bbade2c10912030945ufb7dd78rac68fbb3147cc08f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 I have a custom proxy which is being used to direct traffic based on
application layer data. The proxy receives connections from foreign
addresses and then proxies them to applications running on the local
machine--the same machine the proxy is running on.

The problem is that all the connections to applications appear to come
from the proxy server's ip address instead of the originating foreign
address. We need the source address to be the foreign address and
tried to use SNAT to do it. But apparent SNAT doesn't work when the
source and destination addresses are all on local interfaces.

When I do a tcpdump I see all the traffic that should be caught by the
SNAT rule appears on the loopback interface. When I check the rule no
packets are caught by it.

Is there anyway to get SNAT to work for local source and destination
address? Or is this some sort of limitation imposed by the kernel or
iptables?

 thanks,

 Dave
