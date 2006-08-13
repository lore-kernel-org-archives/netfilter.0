From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: port redirection
Date: Sun, 13 Aug 2006 07:18:55 +0100
Message-ID: <87d5b5cg4w.fsf@newton.gmurray.org.uk>
References: <20060812191819.8d677f6c.bsl04@uark.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1155449936; bh=qbnddUgU+q5xnxGTUFMQx1oPrlE=; h=Received:
	X-Authentication-Warning:From:To:Subject:References:X-Hashcash:
	Date:In-Reply-To:Message-ID:User-Agent:MIME-Version:Content-Type; b=Y
	bSsOpvHEvywysB3QKyWYjgJv6XDDKV4y1WCYvYUxPkvjaTarmGpN67q/q202dlRx1zx
	KdDGO5RR8qJVVsm3Mw==
In-Reply-To: <20060812191819.8d677f6c.bsl04@uark.edu> (Brian Lewis's message
	of "Sat, 12 Aug 2006 19:18:19 -0500")
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

Brian Lewis <bsl04@uark.edu> writes:

> I run a servlet container that wants to listen on TCP 8080. I want to
> redirect TCP 80 on my machine to 8080 on the same machine.
>
> If I do -t nat -I PREROUTING -i $IF -d $IP -p tcp --dport 80 -j REDIRECT
> --to-port 8080, it works in that I reach the 8080 server when I connect
> to 80.
>
> But I have to allow 8080 through. Is there a way to provide access to the
> 8080 server via port 80 without having to allow 8080?

Would the following work?

iptables -t mangle -A PREROUTING -p tcp --dport 80 -j MARK
--set-mark 1

iptables -A INPUT -m mark --mark 1 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j DROP


