From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: bolcking gmail in squid
Date: Fri, 24 Jun 2005 13:13:20 +0200
Message-ID: <20050624111224.062C58EDCEB@smtp.sterenborg.info>
References: <WorldClient-F200506241631.AA31460577@ckarsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200506241631.AA31460577@ckarsystems.com>
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

Sreenivasa Rao.K [sreenivask@ckarsystems.com] scribbled on :

>  Dear Alexandru ,
> 
>  These acls didn't work.
> 
> I want to give access to google website and at the sametime
> block gmail website in squid  from accessing.

The example below should work AFAICS (did you reload the squid config
?), unless your clients are using another domain that is not blocked by
these acl's. Are you sure they're accessing the internet via Squid ?

Unless your clients are using NAT, this is not a Netfilter issue so
maybe the squid list can help if this doesn't work.


Gr,
Rob


> -----Original Message-----
> From: George Alexandru Dragoi <waruiinu@gmail.com>
> To: "Sreenivasa Rao.K" <sreenivask@ckarsystems.com>
> Cc: netfilter@lists.netfilter.org
> Date: Fri, 24 Jun 2005 05:35:47 -0400
> Subject: Re: bolcking gmail in squid
> 
>> acl gmail dstdomain .mail.google.com
>> acl gmail dstdomain .gmail.com
>> acl gmail dstdomain .gmail.google.com
>> 
>> 
>> And a very first rule like this:
>> 
>> http_access deny gmail


