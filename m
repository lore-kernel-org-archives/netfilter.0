From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables blocking all ports except port 80
Date: Tue, 14 Jun 2011 21:15:22 +0100
Message-ID: <1308082522.1837.13.camel@andybev-desktop>
References: <BANLkTimH9xLROcOosO+Qa5-hhOGYyG8pjA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1308082527; bh=M8mF2tmAzgSLCSfYl7Aar4d+eflRxZJm+nQJ/
	+4HuC8=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=KqAyEDs5
	1vagqEahPZxwxPu8TbhOdAeu8qYPwdN2ZtJkdjs9EuOG44CM9we2Wn8ExSwZZY+5j7I
	gvgh4Xf5Ct0LigPHHW285c0iSroGKZekG4F9RfAjHGkANu96Lk9dY4car0jwS9ju7d2
	PB5laytLrkItggFZVuwfiRp9VqhqU=
In-Reply-To: <BANLkTimH9xLROcOosO+Qa5-hhOGYyG8pjA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Matala <ivanmatala@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2011-06-14 at 07:41 -0700, Ivan Matala wrote:
> In short, what rules to add to block other ports except, ssh and port 80, 3128.

Assuming you're using iptables to forward packets, something like:

iptables -A FORWARD -p tcp -m multiport --dports 22,80,3128 -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j DROP

Your email is not very clear, so it depends whether you are trying to
allow inbound connections or connections to external servers. You'll
therefore need to change dports to sports as required. In the same vein
you may also need to change FORWARD to INPUT.

Andy


