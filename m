From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: NetBIOS browsing across subnets
Date: Fri, 5 Jul 2002 12:30:44 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA240@JUPITER>
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
Cc: netfilter@lists.samba.org

OMG..What the..

so much trouble.. wasn't the original problem that they wanted to see each
others machine/shares off NN? I'm getting off track now and confused...

You don't need smbmount on the firewall.. it's just there to handle the
broadcast of machines on both networks and broadcasts to both networks like
a *yes* proxy server for Netbios.. BUT it must be the master browser.. 1
machine 1 solution, not 2 and transfering this and that,etc.. *shudders*...

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Michael [mailto:mutk@ozemail.com.au]
Sent: Friday, 05 July 2002 1:22 PM
To: netfilter@lists.samba.org
Subject: Re: NetBIOS browsing across subnets


Yes, I did say you compromise the Samba servers by doing this.....

I have had similar problems, and most were fixed with upgrade NFS... 
Also, having filesystems mounted on demand and unmount at idle has 
minimised problems.

Ok, NFS will in future be *the* solution. Just that having Samba running 
on a firewall machine is erksome for many reasons..

Another solution, to avoid Samba on the firewall system having to write 
and read from the Host's filesystem is to yes, have Samba running on the 
firewall, but have a Samba server on each subnet.

Then just have the firewall host smbmount the two subnet's Samba 
server's shared filesystems. The firewall host then advertises the 
shared filesystem from one subnet on the other subnet..

BTW is there any such hing as a NetBIOS proxy server?? This will be ideal.

Cheers,
Michael

George Vieira wrote:

>I'm sorry but NFS is no way a solution for this.. I've seen crashes on NFS
>servers before many times and also when one server has a problem then the
>other server goes into a panic attack.. sometimes even goes into 100%CPU as
>I've seen before.. yes upgrade NFS if youmust but I still say samba as
>master browser is the way to go as this works perfectly on my VPN
>server/firewall without a hitch..
>
>thanks,
>George Vieira
>Systems Manager
>Citadel Computer Systems P/L
>http://www.citadelcomputer.com.au
>



