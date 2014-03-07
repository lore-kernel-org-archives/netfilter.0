From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Some oddities while setting up outbound filtering on a web server
Date: Fri, 7 Mar 2014 00:01:50 -0500
Message-ID: <201403070001.51011.neal.p.murphy@alum.wpi.edu>
References: <CA+5v4QC81A2gU8i566G3Nh_dERTv6LbkssZDfSe664BXj=9NEg@mail.gmail.com> <CA+5v4QAeWp6Azau3nYpL2ev-jqstSs+-BGBMuyavbKSK85JiAg@mail.gmail.com> <53194F19.90708@chello.at>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53194F19.90708@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, March 06, 2014 11:46:17 PM Mart Frauenlob wrote:
> >> Then try to enable it???
> > 
> > echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
> > -su: /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal: Permission
> > denied
> 
> strange, don't know what is the problem there...

Module nf_conntrack_ipv4 has not been INSed.
