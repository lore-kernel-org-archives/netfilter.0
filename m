From: ml@proficuous.com
Subject: RE: PLEASE HELP with DNAT problem
Date: Thu, 30 Oct 2003 21:02:34 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4780.209.134.141.210.1067569354.squirrel@webmail.proficuous.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A28AC9F@wardrive.citadelcomputer.com.a
     u>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A28AC9F@wardrive.citadelcomputer.com.a
     u>
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
Content-Transfer-Encoding: 7bit
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: ml@proficuous.com, netfilter@lists.netfilter.org

>> I tried to DNAT the lan back
>> to itself and
>> it just isn't working..
>
> If I think I know what your trying to do, you are doing a LAN to LAN
> connection right?
>
> Don't forget that a LAN to LAN DNAT also must have a POSTROUTING SNAT rule
> so the destination server replies back via the firewall/NAT server.
> otherwise it'll reply directly to the client and the client will drop the
> packet immediately.
Ok..i guess this is what i'm missing.  I'm not sure where i should be
source natting to however.

the packet starts at lan....destined for internet...now..it supposedly
should get DNATED back to lan..... now like i say..after the first DNAT
rule that DNATS it back to the lan, it hits another one one that the DNATs
it to the DMZ, but this one doesn't have the port specific information, as
normally i'd want it ending up in the DMZ.

i just don't see how a SNAT fits in here.  but then that's why i'm asking
fr help.

Thanks agagin
Aaron P. Martinez
>
> Have you done any tcpdumping or -j LOGing??
>
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>
>
>> -----Original Message-----
>> From: ml@proficuous.com [mailto:ml@proficuous.com]
>> Sent: Friday, 31 October 2003 1:18 PM
>> To: netfilter@lists.netfilter.org
>> Subject: PLEASE HELP with DNAT problem
>


