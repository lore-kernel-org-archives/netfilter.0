From: Aseem Rastogi <aseem@india.tejasnetworks.com>
Subject: Re: removing duplicate rules
Date: Mon, 17 Oct 2005 03:16:48 +0530
Message-ID: <4352CA48.3070502@india.tejasnetworks.com>
References: <6.2.1.2.0.20051016030004.030e32a0@147.202.41.46>
	<Pine.LNX.4.60.0510160358290.23213@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP
	id 8135B7396C; Sun, 16 Oct 2005 21:35:47 +0000 (UTC)
Received: from india.tejasnetworks.com (aseem.india.tejasnetworks.com
	[192.168.0.38]) by anche.india.tejasnetworks.com (*****) with ESMTP
	id 49C7F73969; Mon, 17 Oct 2005 03:05:45 +0530 (IST)
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

Hi All,

Continuing this post:

Adding a rule multiple times shows multiple entries in iptables -L 
output. My question is : does it have any performance impact on packet 
processing ?

Should not be because as soon as a rule is matched, it should come out, 
Right?

Regards,
Aseem.

R. DuFresne wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On Sun, 16 Oct 2005, amit pasari wrote:
>
>>
>>
>> hello,
>> i have been using iptables for quite sometime , Now my problem is , 
>> if by make i add multiple type of same rule in iptables it accepts N 
>> number of entries . So can any body tell me how to aviod that or can 
>> i check the same rule exists before Appending it into the table.
>> Eg : iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP
>> i have add the above rules 10 times 20 times but the system never 
>> says the above rule exist . Can anybody tell me how can i check or 
>> aviod .
>>
>
> grep?
>
>
> Thanks,
>
> Ron DuFresne
> - -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
> Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>
> iD8DBQFDUghCst+vzJSwZikRAsIpAKCbK+H2iM4OrnX/YGDmmN/SpphHOACfRXbc
> lA4Ca2xTnrUro05Omj7ATR0=
> =GSPW
> -----END PGP SIGNATURE-----
>
>


-- 
The end is always good. If it's not good, it's not the end.




