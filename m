From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: selective connection tracking?
Date: Wed, 12 May 2004 18:58:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405121858.30104.Antony@Soft-Solutions.co.uk>
References: <1084383723.40a261ebb1122@mail.borderware.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084383723.40a261ebb1122@mail.borderware.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 12 May 2004 6:42 pm, fming@borderware.com wrote:

> Hi,
>
> I am from the FreeBSD/ipfilter world.   I recently switched to Linux and
> netfilter.

Welcome to our world :)

> One question I have with netfilter connection tracking is whether there I
> can instruct the connection tracking to selectively tracking connections.

No.

> Looks to me once I loaded the conn_track modules, everything was tracked.

Correct.

> Is there a way I can specify, for example, that I only want http to be
> tracked? All other traffic will be dropped anyway, tracked or not.

If it's going to be dropped, there won't be a connection, therefore the other 
traffic won't consume any connection tracking resources.

Regards,

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


