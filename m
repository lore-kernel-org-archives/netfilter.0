From: Michael <mutk@ozemail.com.au>
Subject: Re: NetBIOS browsing across subnets
Date: Fri, 05 Jul 2002 12:42:56 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D2507B0.6030202@ozemail.com.au>
References: <200FAA488DE0D41194F10010B597610D2BA23D@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

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



