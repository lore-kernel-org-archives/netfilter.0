From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: NetBIOS browsing across subnets
Date: Fri, 5 Jul 2002 11:49:50 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA23E@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Michael' <mutk@ozemail.com.au>, netfilter@lists.samba.org

I'm sorry but NFS is no way a solution for this.. I've seen crashes on NFS
servers before many times and also when one server has a problem then the
other server goes into a panic attack.. sometimes even goes into 100%CPU as
I've seen before.. yes upgrade NFS if youmust but I still say samba as
master browser is the way to go as this works perfectly on my VPN
server/firewall without a hitch..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Michael [mailto:mutk@ozemail.com.au]
Sent: Friday, 05 July 2002 12:43 PM
To: netfilter@lists.samba.org
Subject: Re: NetBIOS browsing across subnets


There generally isn't a way to do it. NetBIOS is feeble, and non 
routeable...

One way around it, and it doesn't involve NetBIOS/samba on the firewall:

You need two Samba servers, one on each subnet. Export the filesystem to 
be shared from one Samba server to the other. This means that the 
firewall only has to allow NFS traffic from one SMB to the other. This 
way you don't compromise the firewall machine.. only the Samba servers 
by running NFS...



Cheers,
Michael

>
>
>-----Original Message-----
>From: Ron Gedye [mailto:rgedye@teleformix.com]
>Sent: Friday, 05 July 2002 10:38 AM
>To: netfilter@lists.samba.org
>Subject: Re: NetBIOS browsing across subnets
>
>
>On Thursday 04 July 2002 15 46 r, you wrote:
>
>>If anyone knows a way of supporting Windows browsing across a router,
>>please speak up :-)
>>



