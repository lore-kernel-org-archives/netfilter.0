From: Jason Opperisano <opie@817west.com>
Subject: Re: Are established connections interrupted when iptables is
	restarted?
Date: Wed, 22 Dec 2004 23:37:15 -0500
Message-ID: <1103776635.6478.16.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10412222111230.18976-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.05.10412222111230.18976-100000@darkstar.sysinfo.com>
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

On Wed, 2004-12-22 at 21:13, R. DuFresne wrote:
> On Wed, 22 Dec 2004, Deepak Seshadri wrote:
> 
> > Hello group,
> > 
> > I make changes in the /etc/sysconfig/iptables file and then do a "service
> > iptables restart". Would this interrupt the established connections through
> > the firewall?
> 
> It can.  with connection tracking and matching on NEW ! syn, with a -j
> DROP it certainly will.

um--no.  connection tracking begins as soon as the 'ip_conntrack' module
is loaded.  if you:

1) modprobe ip_conntrack

2) establish a bunch of connections through the firewall

3) load a policy that drops "-p tcp ! --syn -m state --state NEW"
packets--your existing connections will be just fine, as they are in the
ESTABLISHED (and likely ASSURED) state.

the previous poster that said "as long as 'service iptables restart'
doesn't unload the ip_conntrack module" was correct.

now--the *real* question is, "does 'service iptables restart' unload
ip_conntrack?"

on FC2 it appears the answer is:  yes. looking in /etc/init.d/iptables,
a 'restart' performs:

        stop
        start

the 'stop' function performs:

        if [ "x$IPTABLES_MODULES_UNLOAD" = "xyes" ]; then
          echo -n $"Unloading $IPTABLES modules: " 
          <snip>
        
so--setting:
  IPTABLES_MODULES_UNLOAD=no

in /etc/sysconfig/iptables (it defaults to 'yes') should get us to a
state where 'service iptables restart' does not unload the ip_conntrack
module.

HTH...

-j
 
--
"Ah, beer, my one weakness. My achilles heel, if you will."
	--The Simpsons


