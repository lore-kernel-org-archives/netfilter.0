From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: REJECT  in PREROUTING
Date: Mon, 3 Mar 2003 10:16:27 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303031013390.9122@dns.toxicfilms.tv>
References: <000001c2dde4$f79479a0$f767f081@shuttle>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c2dde4$f79479a0$f767f081@shuttle>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?Q?Johan_Fredrik_=D8hman?= <johanfo@ohman.no>
Cc: netfilter@lists.netfilter.org

> Sorry if this question has been asked before, but:
>
>
> Is there any good reasons, technically or political, to disallow the REJECT
> target in the PREROUTING table?
The PREROUTING chain is in nat and mangle tables.
REJECT is supposed to be used in filter table; Do filtering only there.
Nat is supposed to be used for address translation, and mangle for just
mangling. That's the short answer.
This question indeed has been asked on  the list, please look it up for a
more detailed answer if you wish.

Regards,
Maciej Soltysiak

