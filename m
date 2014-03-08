From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Some oddities while setting up outbound filtering on a web server
Date: Sat, 8 Mar 2014 00:20:32 -0500
Message-ID: <201403080020.32162.neal.p.murphy@alum.wpi.edu>
References: <CA+5v4QC81A2gU8i566G3Nh_dERTv6LbkssZDfSe664BXj=9NEg@mail.gmail.com> <201403070001.51011.neal.p.murphy@alum.wpi.edu> <CA+5v4QCVs_H=4v4MS7g2AvBKyVmEA=kbwR2P+f_ok0GUaO1CGw@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+5v4QCVs_H=4v4MS7g2AvBKyVmEA=kbwR2P+f_ok0GUaO1CGw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday, March 07, 2014 09:05:10 PM Anthony Taylor wrote:
> On Thu, Mar 6, 2014 at 11:01 PM, Neal Murphy <neal.p.murphy@alum.wpi.edu> 
wrote:
> > On Thursday, March 06, 2014 11:46:17 PM Mart Frauenlob wrote:
> >> >> Then try to enable it???
> >> > 
> >> > echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
> >> > -su: /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal: Permission
> >> > denied
> >> 
> >> strange, don't know what is the problem there...
> > 
> > Module nf_conntrack_ipv4 has not been INSed.
> 
> I'm not sure what that means.

'insmod nf_conntrack_ipv4' and the error should go away. That particular file 
(among others) doesn't exist if that particular module has not been loaded. 
And, if I presume correctly, userspace (generally) cannot create files in 
/proc. Thus the permission error.
