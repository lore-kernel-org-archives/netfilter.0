From: Philip Craig <philipc@snapgear.com>
Subject: Re: connection dropouts
Date: Thu, 26 Feb 2004 19:00:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403DB5B3.7030509@snapgear.com>
References: <E1Aw4LY-001AoE-0V@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1Aw4LY-001AoE-0V@alf1.lmb.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Cc: netfilter@lists.netfilter.org

T. Horsnell (tsh) wrote:
> The firewall box is a 1GHz AMD with 128MBytes mem, and
> /proc/sys/net/ipv4/ip_conntrack_max is currently set to 8184.
> 
> How can I track how close I get to this limit? 

There will be a syslog message telling you when you reach the limit.
Or 'grep ip_conntrack /proc/slabinfo', and read the first number
(active_objs).
Or 'wc -l /proc/net/ip_conntrack', but that is slow and maybe unreliable.

> What is the memory use per conntrack entry?

The kernel displays this when the conntrack module is loaded, eg
kernel: ip_conntrack version 2.1 (8191 buckets, 65528 max) - 300 bytes
per conntrack
Or 'grep ip_conntrack /proc/slabinfo', and read the third number (objsize).
(Hmm, except I noticed those two numbers are different on my PC.  The
slabinfo may be more accurate.)

> Is there anything particular about NAT entries in the conntrack
> tables that would make NAT'd hosts more prone to net hangups
> that unNAT'd ones?

Not that I'm aware of.  Do the hangups have any sort of consistency?

> If I raise my ip_conntrack_max value, am I likely to crash
> the firewall if I raise it too high?
> What is the theoretical maximum number of conntrack entries?
> What is the theoretical maximum number of NAT connections?
> (this would seem to me to be 65536 - the maximum number
> of ports available on a single host, i.e. the NAT box
> since it has to map a source host:hostport into a NAT:natport)

The only limit is available memory.  It is not limited to 65536 since
each entry is based off protocol/source host/source port/dest host/dest
port, the number of combinations of which is more than you'll ever need.
There is a limitation of 65535 NATed connections to a single port on a
given dest host (ie if source host, dest host, and dest port are all
constant), but that would be unusual to encounter.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


