From: Andrew Beverley <andy@andybev.com>
Subject: Re: connlimit troubles and questions
Date: Wed, 19 Sep 2012 20:53:33 +0100
Message-ID: <1348084413.4663.61.camel@andrew-desktop>
References: <20120919185526.M10579@todhackett.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120919185526.M10579@todhackett.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1348084416;
	bh=7UAb6KZIkt1OYi+9+pfUV9sj1VzcxFFis9CPpU8Sy4w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=Gov/yf1io+XmOUZUc0TVDcQvEKFjbGNrScIEGpkeCJyUdnpTTBeJNX9dLQ350eyPt
	 nMhigqm2VuoBPOneKmkSWBZDeCHb7Nm8Yzyj+j2FrYMDNMCOOLRbxOgia+epheBwUB
	 QqknQ8W1/ILnhEzjB2IG5bxsWzYTIdm48vQ0rIDU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: me <todh@todhackett.com>
Cc: netfilter@vger.kernel.org

On Wed, 2012-09-19 at 12:16 -0700, me wrote:
> I haven't been able to find out how long those first tcp connections stay around. Are
> they timing out, hence the second connection, or is the udp stuff what is causing me
> grief?  

You can use the conntrack userspace application to view the connection
tracking table. This shows the timeout of each connection, which should
help you. UDP connections are stateless so will time out fairly quickly.

> If they are timing out, how can I keep limiting connections?  

Try changing /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout

> I have a range of udp ports that are given out, can I use those somehow?

The multipart match should do the trick. See man iptables.

Andy


