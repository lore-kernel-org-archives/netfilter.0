From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: NetBIOS browsing across subnets
Date: Fri, 5 Jul 2002 10:48:10 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA23D@JUPITER>
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
To: 'Ron Gedye' <rgedye@teleformix.com>, netfilter@lists.samba.org

WINS will not help.. it's just to help resolution og hostnames.. but he
wants to see them in Network Neighbourhood and WINS won't do this..
It'll have to be Samba on the firewall with remote announcements like this:

remote announce = 192.168.1.255 192.168.2.255

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Ron Gedye [mailto:rgedye@teleformix.com]
Sent: Friday, 05 July 2002 10:38 AM
To: netfilter@lists.samba.org
Subject: Re: NetBIOS browsing across subnets


On Thursday 04 July 2002 15 46 r, you wrote:

>
> If anyone knows a way of supporting Windows browsing across a router,
> please speak up :-)
>

Netbios will not pass a router.  The only way to allow this type of browsing

is to use a WINS Server.  There is a way to set up either a push or pull 
mechanism to share info between different netbios 'zones'. (although it's 
been a few years since I had no other choice than windows networking and 
don't remember the specifics)

Ron

