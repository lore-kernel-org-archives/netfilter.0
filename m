From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re[2]: Question about marking traffic.
Date: Mon, 28 Jun 2004 22:04:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406282204.57874.Antony@Soft-Solutions.co.uk>
References: <1987903676.20040628181707@op.pl> <200406281731.40331.Antony@Soft-Solutions.co.uk> <1499142519.20040628225033@op.pl>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1499142519.20040628225033@op.pl>
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

On Monday 28 June 2004 9:50 pm, mortar wrote:

> I have one more question. Maybe someone can help.
>
> What about tracking connections on non standard ftp ports (or http), for
> example 2121? How can i recognize them as a ftp (or http) connections
> and proper mark them?

I would answer this "you can recognise them just the same as you can recognise 
them on 'standard' ports 21/20 or 80" - in other words (with a packet filter) 
you can't - you just have to assume that ports = services (not always a safe 
assumption).

> I read about layer7-filter project, but is it necessery?

Yes - if you want to know whether a traffic stream is HTTP (etc), you have to 
look at OSI layer 7, because that's the only place HTTP means anything.

Netfilter works at OSI layers 3 & 4, therefore it can't identify what is HTTP 
/ FTP / DNS etc - it can only guess.

Regards,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


