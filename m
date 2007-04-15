From: "Thomas d'Otreppe" <tdotreppe@gmail.com>
Subject: Re: Unable to block ICMP
Date: Sun, 15 Apr 2007 17:16:35 +0200
Message-ID: <78a2adce0704150816o77d64848x5982caafd70c30df@mail.gmail.com>
References: <46224132.4080702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=kylpglMHjP6xU/gZTunqoxRR3SnDYnAKTHsJBmZGN9rBE6krKjQLnrfA1uAQfVPCjMWFz/np3BqBQsy/vlvW0BJ9atqaUWWabvax4LLAlDR3Tb4g1t0aDIRg1QLlQ//dvcssKgiZzLZUT3q41DJncK0T6p1K7BNOX6f/q+3fbXo=
In-Reply-To: <46224132.4080702@gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ronald <ronald645@gmail.com>
Cc: netfilter@lists.netfilter.org

Ronald,

use "iptables -A INPUT -p icmp -j DROP" instead of "iptables -A OUTPUT
-p icmp -j DROP"

Best regards,

Thomas

2007/4/15, Ronald <ronald645@gmail.com>:
> Check this thread (posted by me):
>
> http://forums.fedoraforum.org/forum/showthread.php?t=152539
>
> Could anyone help me here with the problem please ?
>
>
>                                  Ronald
>
>

