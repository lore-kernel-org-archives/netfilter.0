From: Philip Ho <cbho@ie.cuhk.edu.hk>
Subject: Re: how can i set iptables for forwarding
Date: Thu, 12 Jun 2003 12:25:22 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EE800B2.5496B7AB@ie.cuhk.edu.hk>
References: <OFE825FCD3.3D9D1EE5-ON88256D3F.00051D26-88256D3F.00057A38@deepwoods.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: dawn lin <alantisjun@hotmail.com>
Cc: Carol Anne Ogdin <caogdin@deepwoods.com>, netfilter@lists.netfilter.org

Dawn

You need to make sure routing table works and ip_forward set to 1.

iptables control what packets to forward and what packets not to forward.

Regards,
philip


Carol Anne Ogdin wrote:

> >i wonder iptables can help me set my Computer B to forward packets to
> >computer A.
> >is that possible?
> That's not iptable's job.  You need a router.  Read the documenation for
> the "ip" command on your Linux system.  All you need is a simple route on
> computer B that forwards to C...and, of course, routes for traffic from C
> back to A, etc., and to set the appropriate "ip_forward" value to 1.
>
> --Carol Anne
>
>  Carol Anne Ogdin            http://www.net-working.com                530/295-3657
>
>  Deep Woods Technology, Inc.  http://www.deepwoods.com        CAOgdin@deepwoods.com
>
>   Leveraging technology to
>    restore the soul of the
>         organization
>


