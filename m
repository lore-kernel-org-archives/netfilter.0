From: fming@borderware.com
Subject: Re: selective connection tracking?
Date: Wed, 12 May 2004 14:50:16 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084387816.40a271e8dee50@mail.borderware.com>
References: <1084383723.40a261ebb1122@mail.borderware.com> <200405121858.30104.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405121858.30104.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>, Antony Stone <Antony@Soft-Solutions.co.uk>

Quoting Antony Stone <Antony@Soft-Solutions.co.uk>:
> 
> 
> > Looks to me once I loaded the conn_track modules, everything was
> tracked.
> 
> Correct.
> 
> > Is there a way I can specify, for example, that I only want http to
> be
> > tracked? All other traffic will be dropped anyway, tracked or not.
> 
> If it's going to be dropped, there won't be a connection, therefore the
> other 
> traffic won't consume any connection tracking resources.

I believe the connection tracking is useful for the FORWARD filter, however, 
for the INPUT filter, its the job of Linux TCP/UDP to take care of those 
things. Keep another set of stat below the IP layer does not make sense to me. 
The upper layer protocol has a better knowledge of the connection state than 
the conn_track anyway.

> 
> Regards,
> 
> Antony.
> 
> -- 
> How I want a drink, alcoholic of course, after the heavy chapters
> involving 
> quantum mechanics.
> 
>  - 3.14159265358979
> 
>                                                      Please reply to the
> list;
>                                                            please don't
> CC me.
> 
> 

