From: Askar Ali <askarali@gmail.com>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 18:03:47 +0500
Message-ID: <45E2DAB3.8010201@gmail.com>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
	b=RZ2+AynqvVZwLiVunNnz3Q65Mowg3/Pqkxpp/WYDojYsEchY6eOPoDrsAY5KtChH/aV4DyS5vVZJwsrk9hcxp8TKb8NtthVtEkkyEzrq3Pn4FslyvW3fOFV2wNEOSGEGOStmHWnpSc430BXkP55VF1haoNOZ+9wWfvaHEczMdxs=
In-Reply-To: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
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
To: netfilter@lists.netfilter.org

angico, on 02/26/2007 05:45 PM [GMT+500], wrote :
> hi, everybody!
> i have a problem that you may help to solve, surely.
> i have a server (a) connected to the internet via eth0/ppp0 (adsl).
> another computer (b) is connected to this server thru eth1, and it should reach the internet via the server which is its gateway. and so it did!... up to a month ago.
> i think nothing's changed. all i did was a re-installing of my gentoo based system on the server, due to problems on the hard-disk. but firewall rules (iptables) remain the same. and the netted computer can't reach the internet anymore! 
> things got exquisite because:
>   
Try this rule on  your gateway..


iptables -A POSTROUTING -t nat -o ppp0 -j MASQUERADE

Thanks

