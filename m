From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bandwidth Shaping requests coming from a web server
Date: Wed, 23 Jun 2004 09:57:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406230957.14908.Antony@Soft-Solutions.co.uk>
References: <2a627cd2040622200675aed3eb@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2a627cd2040622200675aed3eb@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 23 June 2004 4:06 am, Ian Holsman wrote:

> Hi.
>
> I would like to write a apache module which limits the speed we send
> out the response based on some internal algorithm (like a cookie, or a
> line in the request header, or some random number ;-)).

I don't know if Apache can do this sort of thing itself, but Squid certainly 
can (the phrase it uses for that is "delay pools").   Since you want to do 
this for a server whcih you run, rather than your clients accessing external 
servers, you want Squid in Accelerator Mode rather than Proxying Mode.

See http://www.squid-cache.org for more info.

> also .. any tips on how to this on a BSD box?

You can certainly run Squid under BSD (and you certainly can't run netfilter 
under BSD).

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


