From: "Thomas d'Otreppe" <tdotreppe@gmail.com>
Subject: Re: Unable to block ICMP
Date: Sun, 15 Apr 2007 18:14:39 +0200
Message-ID: <78a2adce0704150914y4e9fd552m8e316ebd1b00ae79@mail.gmail.com>
References: <46224132.4080702@gmail.com>
	<78a2adce0704150816o77d64848x5982caafd70c30df@mail.gmail.com>
	<46224EFE.6060409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=j4rMtX+N8yzUAK2vAGr8/fvFzjP773hpRBIz67HYxoCUL6gO/EdOxGZVXcHrRkHu8D1913ye/pZmaWrWQuhoeHpT3n4oPHDCppvHICqnpoXE6czQ+ZQTg8LCjYrTTSWmymEQRFo/6adulzSxiRA4yW/KG2tWE/KsgMnJgSnEzDI=
In-Reply-To: <46224EFE.6060409@gmail.com>
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
To: netfilter@lists.netfilter.org

Ronald,

the subject of your mail is "Unable to block ICMP", so I just told you
how to block the ICMP (by looking at the rules you posted on the link
you gave).

Best regards,

Thomas

PS: Please use "answer to All", so that everybody get the answer and
can follow this thread

2007/4/15, Ronald <ronald645@gmail.com>:
> Thomas d'Otreppe schreef:
> > Ronald,
> >
> > use "iptables -A INPUT -p icmp -j DROP" instead of "iptables -A OUTPUT
> > -p icmp -j DROP"
> >
> > Best regards,
> >
> > Thomas
> >
> > 2007/4/15, Ronald <ronald645@gmail.com>:
> >> Check this thread (posted by me):
> >>
> >> http://forums.fedoraforum.org/forum/showthread.php?t=152539
> >>
> >> Could anyone help me here with the problem please ?
> >>
> >>
> >>                                  Ronald
> >>
> >>
> >
> That didn't work either. pcflank.com still sees the ports as closed. Any
> more sugeestions?
>

