From: "azeem ahmad" <azeem484@hotmail.com>
Subject: Re: smtp
Date: Fri, 14 May 2004 20:11:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F33V6uPDVniSn0005fa4b@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

thanks a lot for solving this problem
but here just tell me one thing more that how u said that i m safe. is there 
tcpdump output telling something. if yes then how u judge it.

Regards
Azeem


>From: Gavin Hamill <gdh@acentral.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: smtp
>Date: Fri, 14 May 2004 20:47:23 +0100
>
>On Friday 14 May 2004 19:54, azeem ahmad wrote:
> > hi
> > here is the out put even after blocking all smtp
> > 
>---------------------------------------------------------------------------
> >------------------------------------------------------
> >21:17:31.259275
> > 192.168.0.101.4730 > 207.24.89.66.smtp: S
> > 556950735:556950735(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
>
>Notice how all of these are your infected PC trying to talk to the outside
>world, and that there are no packets from the outside world to the infected
>PC? This will be due to your iptables commands blocking this from 
>happening..
>and given that the snapshot took place over 4 seconds, I would say you're
>quite safe :)
>
>Yes, the infected PC will continue to spew out packets until it's fixed, 
>but
>there is no danger, and your Internet bandwidth will no longer be affected.
>
>Cheers,
>Gavin.
>

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail


