From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: How do I block www.yahoo.com
Date: Sun, 03 Sep 2006 13:27:42 +0100
Message-ID: <878xl1t9s1.fsf@newton.gmurray.org.uk>
References: <20060903105127.33678.qmail@web36605.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1157286465; bh=ROQ6GNciCfErvvHGTHGjAovG/iM=; h=Received:
	X-Authentication-Warning:From:To:Subject:References:X-Hashcash:
	Date:In-Reply-To:Message-ID:User-Agent:MIME-Version:Content-Type; b=M
	CcU47LJD0KmT4fDIHc5rClHuxtzy5DNxTgSFa4aVqBt3PuQuoH3VJew5ex5gq1oxaUc
	od5Rp+9g4U4aYkW0UQ==
In-Reply-To: <20060903105127.33678.qmail@web36605.mail.mud.yahoo.com> (saki's
	message of "Sun, 3 Sep 2006 03:51:27 -0700 (PDT)")
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

saki <sakimumustafa@yahoo.com> writes:

> I want to block traffic from host 10.0.1.3 to
> www.yahoo.com through my Gateway server.
>
> I implimented this command :
> #iptables -A FORWARD -o eth0 -s 10.0.1.3 -d
> www.yahoo.com -j DROP
> But could not block traffic. Any idea?

www.yahoo.com has several IP addresses which are served in a
round-robin manner. The above rule will only block traffic to the
particular IP address which was returned when the rule was entered. It
will not block any of the others.

