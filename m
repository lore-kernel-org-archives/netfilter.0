From: Evgeni Vachkov <evgeni.vachkov@investis.com>
Subject: Re: ip_conntrack_tcp Errors
Date: 28 Jun 2004 16:45:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088437519.13933.218.camel@spudgun.dhcp.internal>
References: <1088423237.13933.127.camel@spudgun.dhcp.internal>
	 <40E00F6A.2010604@bofh.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E00F6A.2010604@bofh.bg>
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
To: netfilter@lists.netfilter.org


> > 
> > The ip_conntrack version is 2.1.  kernel is v 2.4.26
> > 
> > Is that a problem with conntrack and its tunning or I am missing some
> > patch? ...Or perhaps it is some other problem with other parts of the
> > kernel? 
> It seems to me that you have applied the tcp window tracking patch from pom-ng.
> The problem is that the client and the server have done the first step of the
> three way handshake, and are in sync, but the firewall for some reason is not.
> So it drops the SYN/ACK, and thus forcing the client to retransmit its SYN and
> initiate a new session (as descibed in the source code of the patch)
> 
> My advice is if you have applied this patch, to remove it, and test the load on the
> firewall again.


As far as I can figure out we are running with
patch-o-matic-ng-20040302. I can see that the latest is
patch-o-matic-ng-20040621. Is this problem present at the version we are
running and is the new version still having the window tracking issues? 

Regards,
Evgeni Vachkov



