From: Javier Sanchez <sjllera@ya.com>
Subject: RE: kernel 2.6 ipsec and DNAT
Date: Mon, 13 Sep 2004 12:32:49 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095071569.27900.963.camel@cluster>
References: <HAEOIFPIBBBLGLHOMLLIMEFACMAA.bclark@eccotours.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLIMEFACMAA.bclark@eccotours.biz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Brent Clark <bclark@eccotours.biz>
Cc: netfilter@lists.netfilter.org



I need nat because the internal ips are private, and the firewall is a
little server i have at home, i dont think about getting another server.
So all the services are on it, quake server, enemy territory, voip, ftp,
http, vpns...

Gateway and clients are on the same subnet, but theres more than one nic
on the server to separate and control the traffic in a better way.

Cheers

?A
> >Hi all,
> 
> >i have recently discovered on the list that more people is suffering the
> >nat problem with ipsec vpn tunnels on 2.6.x kernels, does anyone know if
> >its fixed on 2.6.8.1 ??
> 
> >The unique way i found to bypass the nat problem is using a proxy server
> >(squid), not the best solution but for now im able to surf the web .-)
> 
> Hi all
> 
> Sorry for my ignorance.
> 
> But why would nat a vpn tunnel be a problem.
> Are there certain requirement for creating tunnel.
> Can the vpn server \ client be on the same box as the iptables
> gateway\router\firewall.
> 
> If I remember from Anthony Stone (who seems to be missing in action, anyone
> know why) correctly, its best to not have
> any services running on fw.
> 
> just something I was wondering.
> 
> Kind Regards
> Brent Clark.
> 
> 
> 
-- 
GPG Key id: 0x0EF8926E
GPG: Server - gpg.rediris.es



