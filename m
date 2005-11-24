From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 24 Nov 2005 08:36:32 -0500
Message-ID: <20051124133632.GA3251@bostoncoop.net>
References: <4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
	<Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
	<20051118015254.GA21128@bostoncoop.net>
	<Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
	<437EA014.1060908@rosi-kessel.org>
	<Pine.LNX.4.58.0511192128300.13915@blackhole.kfki.hu>
	<4380B04C.3090204@rosi-kessel.org>
	<Pine.LNX.4.58.0511241155311.20155@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0511241155311.20155@blackhole.kfki.hu>
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
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

On Thu, Nov 24, 2005 at 12:00:17PM +0100, Jozsef Kadlecsik wrote:
> > >> So are there no diagnostics, absent rebuilding with netfilters debugging on,
> > >> for tracing a packet in between mangle PREROUTING and nat PREROUTING?
> > > Without further aid, no.
> > Okay, so I've rebuilt 2.6.8 with NETFILTER_DEBUG=Y. What would be the next
> > step? From what I can tell, NETFILTER_DEBUG isn't something turned on and
> > off in /proc/net or /proc/sys/net, it just is "on," but I'm not quite sure
> > what sort of debug messages we should be trying to get and how.
> You should get debug messages logged with the 'kernel' syslog facility.
> Look at /var/log/kern.log.

Strangely, all that is appearing in /var/log/kern.log are my LOG targets,
in other words, exactly what I was getting with NETFILTER_DEBUG=N.

# grep NETFILTER_DEBUG /boot/config-`uname -r`
CONFIG_NETFILTER_DEBUG=y

# grep -v EEE /var/log/kern.log
<no results>

(where EEE is part of my prefix in --log-prefix for the LOG target).

> I'm going to try to emulate your problem with nfsim using your setup and
> the tcpdump results. Probably that can help.

That would be great. Thanks--
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

