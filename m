From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: iptables ipt_ROUTE
Date: Tue, 03 Nov 2009 21:25:06 +0200
Message-ID: <4AF08392.1040504@caf.com.tr>
References: <490093.21027.qm@web24104.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=caf.com.tr; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:references:subject:subject:mime-version:user-agent:from:from
	:date:date:message-id:received:received; s=originating; t=
	1257276310; bh=VU5wGX2N2Gy3Omt9eFUJHVi4J3geOLOcdUAqXnXEVkw=; b=i
	wCSOZ1dIOzGK1fXmw25bhzjQTXheKHNhTBb3qSPwHYgZqRiQ97/Ghru7RjNsc6z6
	+bEPgX49OZUnq+o7XqtiIut1fwjkbLu/BAZmaIf/ugumy8fA70guwentps2pM75D
	CB1cBASOK/NHHTkhld85PsGSoYa9L4mE4BKpmi5OrM=
In-Reply-To: <490093.21027.qm@web24104.mail.ird.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 03.11.2009 21:03, aidan mcgurn wrote:
[...]
> Ideally i need this facility to route packets via different gateways based on port number unless theres anther way to do besides ipt_ROUTE.

Search the archives:
http://marc.info/?l=netfilter&w=2&r=1&s=ipt_route&q=t

-- 
Eray
