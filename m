From: Andrew Schulman <andrex@alumni.utexas.net>
Subject: Re: Are established connections interrupted when iptables is
	restarted?
Date: Wed, 22 Dec 2004 12:48:11 -0500
Message-ID: <MPG.1c337d639722a0f598969e@localhost>
References: <200412221506.iBMF6cDX082047@jkcpub.iserver.net>
	<200412221511.43567.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

> > I make changes in the /etc/sysconfig/iptables file and then do a "service
> > iptables restart". Would this interrupt the established connections through
> > the firewall?
> 
> Provided that 'service iptables restart' does not unload the conntrack module, 
> then the established-connections table will not be reloaded - you will likely 
> have a second or two of no connectivity while the ruleset is reloaded, 
> though.

Right.  I've done this many times, and never seen any dropped 
connections.  I've even restarted the firewall from a remote ssh 
session, and never had any trouble-- just a short pause in the console 
output.  Of course, that's terrible practice-- if your firewall script 
doesn't finish executing, for whatever reason, then you're hosed until 
you can get back to the console.

-- 
To reply by email, replace "deadspam.com" by "alumni.utexas.net"


