From: "James Miller" <jimm@simutronics.com>
Subject: RE: LVS and fault-tolerant Firewall.
Date: Tue, 16 Sep 2003 17:41:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NDBBKABJBJCIJNAELLKEIECJJDAA.jimm@simutronics.com>
References: <1063747546.3f677fdab3817@webmail.datafx.com.au>
Reply-To: <jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063747546.3f677fdab3817@webmail.datafx.com.au>
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
To: "LinuxVirtualServer.org users mailing list." <lvs-users@linuxvirtualserver.org>
Cc: netfilter@lists.samba.org

Yes, but you can not run iptables/netfilter and maintain connection tracking
with keepalived(vrrp).. so if you fail over, established/related traffic
will not be known to .

For some folks this isn't an issue.  For me is a show-stopper.  I'm sure
there are good reasons why the netfilter folks can't come up with conntrack
state-sharing mechanism.


just my $0.02,
->Jim



-----Original Message-----
From: lvs-users-bounces+jimm=simutronics.com@linuxvirtualserver.org
[mailto:lvs-users-bounces+jimm=simutronics.com@linuxvirtualserver.org]On
Behalf Of mb@os.datafx.com.au
Sent: Tuesday, September 16, 2003 4:26 PM
To: LinuxVirtualServer.org users mailing list.
Subject: Re: LVS and fault-tolerant Firewall.


Quoting Kjetil Torgrim Homme <kjetilho@ifi.uio.no>:

> do you really need LVS?  you only need failover, not load balancing,
> right?

Correct.

>
> keepalived does the failover bit nicely.
>

Excellent! - Exactly what I was looking for.

Regards,
MB

> (Julian Anastasov is working on making LVS integrate with Netfilter.
> LVS passes on the packets before firewall rules are applied.  if the
> code is completed, Netfilter integration will be an option since the
> performance penalty is quite noticable.)
> --
> Kjetil T.			|  read and make up your own mind
> 				|  http://www.cactus48.com/truth.html
> _______________________________________________
> LinuxVirtualServer.org mailing list - lvs-users@LinuxVirtualServer.org
> Send requests to lvs-users-request@LinuxVirtualServer.org
> or go to http://www.in-addr.de/mailman/listinfo/lvs-users
>




-------------------------------------------------------------------------
This e-mail was sent via Data FX Online WebMail http://www.datafx.com.au/

_______________________________________________
LinuxVirtualServer.org mailing list - lvs-users@LinuxVirtualServer.org
Send requests to lvs-users-request@LinuxVirtualServer.org
or go to http://www.in-addr.de/mailman/listinfo/lvs-users


