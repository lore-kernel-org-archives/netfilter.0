From: "Randall J. Parr" <RParr@TemporalArts.COM>
Subject: problem configuring for NFS between RH8 and RH6
Date: Wed, 08 Jan 2003 11:48:31 -0800
Sender: psyche-list-admin@redhat.com
Message-ID: <3E1C808F.9030202@TemporalArts.com>
Reply-To: psyche-list@redhat.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <psyche-list-admin@redhat.com>
Errors-To: psyche-list-admin@redhat.com
List-Help: <mailto:psyche-list-request@redhat.com?subject=help>
List-Post: <mailto:psyche-list@redhat.com>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/psyche-list>,
	<mailto:psyche-list-request@redhat.com?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://listman.redhat.com/mailman/listinfo/psyche-list>,
	<mailto:psyche-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/pipermail/psyche-list/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Guarddog-user@lists.sourceforge.net, netfilter@lists.netfilter.org, psyche-list@redhat.com

I have several RedHat 8, RedHat 7 and RedHat 6 servers.
I am using iptables on the RedHat 7 and 8 servers which I configure 
using GuardDog.

I have been successful configured the firewall for and using NFS RH8 <-> 
RH8 and RH8 <-> RH7.

In the GuardDog, under Protocol,  File Transfer, enabling NFS was 
sufficient to allow RH8 <-> RH8 NFS.

However, when I try to use NFS RH8 <-> RH6 the firewall not allowing the 
NFS transactions.

At first the log messages indicated RH8 -> RH6 port 111 was being 
dropped. In GuardDog, enabling Protocol, Interactive, Sun RPC got past 
this block.

But then the log messages indicated RH8 -> RH6 port 887 was being 
dropped. Note that the dynamic port (in this example 887) changes every 
time I restarted RH6 NFS.

I believe the problem is that RH6 NFS is using dynamic ports below 1024 
and my RH8 kernel settings (sysctl.conf) and GuardDog settings limit the 
dynamic port range to 1024 thru 65000.

I tried to change the dynamic port range via GuardDog but it does not 
allow a value below 1024.

Note: if I disable the firewall temporarily (via GuardDog) NFS RH8 <-> 
RH6 works just fine.

I'm not sure how best (and most safely) to fix this.

QUES 1) Is it possible/safe to change the dynamic port range to 
something below 1024? If it is, how do I do that in GuardDog?

QUES 2) Is it possible to configure the RH6 NFS to only use dynamic 
ports above 1024? And if so, how? (I know how on RH7/8 but RH6 is, uh, 
less "advanced").

QUES 3) Am I off base and this is not the problem at all?

Thanks

R.Parr
Temporal Arts







-- 
Psyche-list mailing list
Psyche-list@redhat.com
https://listman.redhat.com/mailman/listinfo/psyche-list
