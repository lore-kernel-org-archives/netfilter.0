From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: nfs ports
Date: Fri, 28 Jan 2005 14:21:07 -0500
Message-ID: <200501281421.07692.JALaramie@Loudoun-Fairfax.com>
References: <200501281250.55466.JALaramie@Loudoun-Fairfax.com>
	<1106938544.11290.5.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106938544.11290.5.camel@nostromo.bgsecm.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> NFS uses the ports 2049/tcp 2049/udp, but you can obtain them
> from the server using rpcinfo with:
>
> rpcinfo -p localhost|grep "nfs"|grep "tcp"|tr ' ' '\n'|grep -v
> "nfs"|tail -n 2|head -n 1
>
> rpcinfo -p localhost|grep "nfs"|grep "udp"|tr ' ' '\n'|grep -v
> "nfs"|tail -n 2|head -n 1
>
> and for the services quota, lock, stat and mount we use the same method
> but changing the grep "nfs" by grep "mount", by example. Lockd only
> uses udp, quota uses tcp and udp, mount uses tcp and udp and stat uses
> also tcp and udp.
>
> For portmap we use the same method but changing nfs by portmapper. It
> uses tcp and udp. Normally it uses 111/tcp and 111/udp.

I generally don't have trouble finding the assigned ports since I have a tight 
ruleset and good logging. The problem occurs whenever I reboot the server or 
restart the service. Portmapper assigns new ports and all the client 
connections fail. I then have to check the log for failed connections and 
open new ports. At this point I have over 200 ports opened (only a couple of 
which are used at any given time). Jason indicates I can force the daemons to 
use certain ports so I'm going to look into that. Thanks for your help.

Jeff

