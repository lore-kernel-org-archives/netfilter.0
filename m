From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: Odd -m state Error Msg
Date: Mon, 12 Mar 2007 06:36:33 +0000
Message-ID: <8764970xzi.fsf@newton.gmurray.org.uk>
References: <45F4EF05.3060202@wildcash.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: v=0.5; a=rsa-sha256; c=relaxed/simple; d=gmurray.org.uk;
	s=in200703; t=1173681393; bh=Y8bF8YeNZfSIza3s5Q/IwnCBKTkJP5LI7/jyJ/
	kLpXc=; h=Received:X-Authentication-Warning:From:To:Subject:
	References:X-Hashcash:Date:In-Reply-To:Message-ID:User-Agent:
	MIME-Version:Content-Type; b=xKHJuAME8QsCnS/7cOpNti+espNw2t7mPeaKw
	sqPzSGDNEOtbpBpxnHOjloN+2zUQTJxUE7jogmfscBoIUusUg88w/oalkIKEbTanxQT
	jFzdlmullywzsN/7vDPl0heUuCjm/59uzJxZ+gthwxD6FsVrPl0U12RNgKe8XH/P/og
	=
In-Reply-To: <45F4EF05.3060202@wildcash.com> (Rudi Starcevic's message of
	"Mon\, 12 Mar 2007 14\:11\:17 +0800")
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

Rudi Starcevic <tech@wildcash.com> writes:

> Hi,
>
> I've just built a new 2.6.20.1 kernel and am seeing
> this error from my standard firewall script:
>
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables: Invalid argument

To use state, you must also specify the protocol eg 
iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT

