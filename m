From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: no ssh on eth0
Date: Sun, 30 Jul 2006 11:12:31 +0100
Message-ID: <87fygje700.fsf@newton.gmurray.org.uk>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1154254351; bh=lfsu6scVDEAg4hoHLlWwFD7t7sg=; h=Received:
	X-Authentication-Warning:From:To:Subject:References:X-Hashcash:
	Date:In-Reply-To:Message-ID:User-Agent:MIME-Version:Content-Type; b=d
	drrIF8DAAJCqfRq8x7C6WA+pQ4cF7fu8h9jX8N561Nc0S69Ekel77yLe5Vkjc4zA4dX
	shmAbkxP8Rw2cycB7A==
In-Reply-To: <1154239260.5429.2.camel@nirvana.aurokruti.in> (varun's message
	of "Sun, 30 Jul 2006 11:31:00 +0530")
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

varun <varun_saa@rediffmail.com> writes:

> Hello,
>
> I a internet server with :
>
> eth0 as WAN and eth1 as LAN.
>
> I want to prevent ssh on eth0.
>
> Howto do it ?

iptables -I INPUT -i eth0 -p tcp --dport 22 -j DROP

