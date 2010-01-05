From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Re: Squid Redirection
Date: Tue, 5 Jan 2010 14:45:02 -0800
Message-ID: <8ec0428d1001051445j60c7a32q25d34e8b0db7560a@mail.gmail.com>
References: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>
	 <4B4235A3.2010409@wow-ia.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=w8VCkcgbpCDHxvMGYTmaVZY87M8uHn/vhWKp9yKxyvs=;
        b=xN7V/2cioW7rJIBe53FzIKUuoqIq4A47JmlCL5SI7C65d/gY3HvVinW3xpcqtd9NY3
         wq0dF31APJDwyq5BS+2t8+/8Ig1sx4scMFpsT33syePJqkFFbYSDnugu2UsBByjv0vdM
         L+LfFvCO9IvQMBt0vkvp0n8cUr/bXBjyUgAyY=
In-Reply-To: <4B4235A3.2010409@wow-ia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Jan 4, 2010 at 10:38, Kenneth Sande <sandekt@wow-ia.net> wrote:
> I do it this way for my one internal subnet. There may be more and better
> options, but this works for me.
>
> "iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s ${INT_NETWORK} -p tcp
> --dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED -j
> REDIRECT --to-port 3128"
>
> Squid must also be set up to accept transparent connections.

Thanks.  Now for another question.  I have about a dozen workstations
that I want to bypass squid (they are in the same subnet as the
workstations that I want traffic sent through squid).  Reading squid's
documentation, they recommend that this be done at the client end or
via iptables.  What's the rule to allow these hosts to bypass squid?

-- 
Aaron Clausen
mightymartianca@gmail.com
