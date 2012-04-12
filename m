From: Andrew Beverley <andy@andybev.com>
Subject: Re: Help with INVALID packets rule. Best way to see the actual
 packet isloating the =?UTF-8?Q?rest=3F=E2=80=8F?=
Date: Thu, 12 Apr 2012 20:48:32 +0100
Message-ID: <1334260112.1603.1.camel@andy-laptop>
References: <BLU155-W39963085CD8F1B244A4730CB3A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU155-W39963085CD8F1B244A4730CB3A0@phx.gbl>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1334260120;
	bh=OGROX7h0cay2Cxfz2MOAEbDzdz0XYHN5wIdE5BIFCTg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=v8Y0z0J6dIYYOM+V8Uj7s6249g1/BMYHz6YxEyX9fpZGl9BaYwSCg2ASf+lQ1Honn
	 m6F0pt6GVaoQOaQ6ntM7BZi5Xn977iubOcfe2bVV7D2RZMifDf1pCr+lC2JyeHtQTT
	 Hv/3JOyXd6zahG7CDzLINXF23Njx1x1FQ+qXyIoo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vishal Jumar <vishaljumar@live.com>
Cc: netfilter@vger.kernel.org

On Thu, 2012-04-12 at 16:25 +0000, Vishal Jumar wrote:
> iptables -A INPUT -m state --state INVALID -j LOG --log-prefix "
> Invalid NOT DROPPED"
...
> How can I view the packet that this rule match is originating?

You may be able to use ulogd as the target instead. The following
website might help; it describes capturing strange packets and examining
them later with wireshark.

http://rm-rf.ca/blog/fun-iptables-ulogd-and-wireshark

Andy


