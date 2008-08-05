From: "Shawn Fitzgerald" <sargon97@gmail.com>
Subject: Re: Setting up a proxy with iptables
Date: Tue, 5 Aug 2008 09:46:47 -0700
Message-ID: <50805eb10808050946s5678b584ud77df506e1692a31@mail.gmail.com>
References: <K4YPNL$F8087895A3C60C84D241022EEA93B6DB@libero.it>
	 <48941506.6080409@unipex.it>
	 <50805eb10808041406x545a5ed1q6da8302370a0accb@mail.gmail.com>
	 <4897F3CB.8090103@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=SGj7IAioP8DPFwQbqGwOhYR4QTkPVA+6iuIlUFdtCb0=;
        b=YcQdqs+pFSYCQWj++XOHNoXUW6Zm1D8YTnm/1X0XxRLflRxTE3Jd16zmHWg+mfRZuH
         9hU+4UxKLxLSxqxMJwvDf4vvm/hemRcKvfpt6kvqBNbnjR5bbfu76TN6S1r9sZ9P+HhE
         nKV6wCApzTKFk1GZe6n4WJszXjEnAgDmm3Kek=
In-Reply-To: <4897F3CB.8090103@unipex.it>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter <netfilter@vger.kernel.org>

I have not logged any incoming packets. I only want to redirect
outbound traffic to localhost 8080. I have only one nic card, eth0 and
it is up. Is it possible that some kernel configuration is causing
problems?

Thanks, Shawn

On Mon, Aug 4, 2008 at 11:31 PM, Michele Petrazzo - Unipex srl
<michele.petrazzo@unipex.it> wrote:
> Shawn Fitzgerald wrote:
>>
>> I did an iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
>> REDIRECT --to-ports 8080 and nothing. Just to make sure the firewall was up
>> I entered iptables -A OUTPUT -j DROP and it did block all outbound traffic.
>>
>> What am I missing here?
>>
>
> Nothing it's not an answer.
> How it's your lan? How are connected your eth0? Have you log the
> incoming packets *before* redirect? Have you tried to tcpdump?
> Too little infos...
>
> Michele
>
