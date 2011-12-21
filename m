From: Andrew Beverley <andy@andybev.com>
Subject: RE: Is the current firewall model static?
Date: Wed, 21 Dec 2011 10:22:18 +0000
Message-ID: <1324462938.4269.177.camel@steve-pc>
References: <000301ccbef9$4a8dc180$dfa94480$@nl>
	 <1324375868.21032.1.camel@steve-pc>  <002201ccbfc1$7743d7f0$65cb87d0$@nl>
	 <1324459648.4269.83.camel@steve-pc>  <000001ccbfc9$8e14a0b0$aa3de210$@nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1324462936;
	bh=0wG1M8/ZtE4bbMPKM83QbZxd7/A9EzWzG4mCU9p9IG8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=n0c3UVS1SKNruzj4LjZWIZjumvSm5sz3IbUrYEv8Bs4pcHYxJr1jHS0jGk4VlYHb1
	 mHoFgrSr3OaVDI0eijcR96TpL/RmOfupYZ4Q/yY14Qq904AqXy7sEwozrpvRwxYeQD
	 10jsguwteNFgLIXYW9SAT8yZIz3hknrC6KSOG0qw=
In-Reply-To: <000001ccbfc9$8e14a0b0$aa3de210$@nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hansa <mythtv@logic-q.nl>
Cc: netfilter@vger.kernel.org

On Wed, 2011-12-21 at 11:16 +0100, Hansa wrote:
> So it's all about 'how' the firewall is managed (by which tools that
>  is). Netfilter by itself isn't static. Using iptables you can change
>  the firewall dynamically. Using system-config-firewall you're static.

Correct.

> 
> Thanks for clarifying!

No problem :-)

Andy


