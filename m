From: Giovanni Cardone <g_cardone@libero.it>
Subject: Re: ip_conntrack_ftp doesn't work
Date: Tue, 25 Jun 2002 11:31:46 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625113146.B255@rainbow>
References: <20020614194204.A232@rainbow> <Pine.LNX.4.33.0206251044140.4927-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0206251044140.4927-100000@blackhole.kfki.hu>; from kadlec@blackhole.kfki.hu on Tue, Jun 25, 2002 at 10:52:12AM +0200
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
To: netfilter@lists.samba.org

On Tue, Jun 25, 2002 at 10:52:12AM +0200, you wrote:
> What is the MTU on your PPP link? Don't you see log entries from the
> ip_conntrack_ftp module like
> 
> conntrack_ftp: partial PORT nnnnnnn...
> 
> I suspect that your link has a very low MTU size and the FTP conntrack
> module don't have a chance to get the whole command pattern in one packet.
> 
> [The module usage counter of the ip_conntrack_ftp module has nothing to do
> with the number of the handled FTP session. It says "No other module
> depends on me"].
I can't understand so well what you are saying... I'm not yet so smart like 
you :) 
Anyway, I tried this(give me some hints, if I'm wrong) :

darkstar\$ /sbin/ifconfig | egrep 'MTU'
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
	  UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1

So, it looks like 1500. Is it so small? Are you right, then? 
		    
> If your MTU is really small and must be kept small, then the case cannot
> be handled by the netfilter conntrack subsystem :-(.

I hope that's not my case(I know, I always have the passive type then...) :(

