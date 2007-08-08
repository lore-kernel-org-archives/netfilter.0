From: "Maxim Veksler" <hq4ever@gmail.com>
Subject: Re: can't ssh outside with OUTPUT (policy ACCEPT)
Date: Wed, 8 Aug 2007 22:35:24 +0300
Message-ID: <b400c69a0708081235t3ff42d69yb28f60cb79231032@mail.gmail.com>
References: <b400c69a0708080942j69063e1em16ef7224f78f6fea@mail.gmail.com>
	<46BA013D.6020709@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=cOZMhLXgvPEgfgok/IssdV25z9axrjCjWU3EjBJfr3rNnvdrn1AkS0cLWzPhy+pxTJWTGFluu/ZGBzCUwlNc2JXgFiGJVhuxoNYF2+h2O6hCOoc+BgU9rUqLSgmoPO89ikEhDKkN/wfqTf97PbZPbpMsKaVnPIrn4p94upGWFns=
In-Reply-To: <46BA013D.6020709@rtij.nl>
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
Content-Type: text/plain; charset="us-ascii"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

On 8/8/07, Martijn Lievaart <m@rtij.nl> wrote:
> Maxim Veksler wrote:
> > Hello,
> >
> > Follwing a recent theread on this list, I've configued my firewall to
> > allow incoming traffic from specific IP's only. Now I can't ssh
> > outside, could some please explain why this happening ?
> >
> > The system is redhat 4.
> >
>
> You don't allow the return packets in. Add a -m state --state
> ESTABLISHED,RELATED match as the first rule in your INPUT chain.
>

That was it, thank you very much.
How could I've debug it myself ?

> HTH,
> M4
>
>


-- 
Cheers,
Maxim Veksler

"Free as in Freedom" - Do u GNU ?

