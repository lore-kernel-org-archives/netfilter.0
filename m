From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: What's required for a stateful firewall + ipvs in 2.6 kernel?
Date: Tue, 23 Sep 2008 12:09:51 +0200
Message-ID: <48D8C06F.6030101@netfilter.org>
References: <48C70B10.3040405@vfive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48C70B10.3040405@vfive.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Ghidinelli <brian@vfive.com>
Cc: netfilter@vger.kernel.org

Brian Ghidinelli wrote:
> I'm trying to get a handle on whether or not it's possible to set up the
> following on a redundant pair of boxes:
> 
> 1. Stateful iptables firewall
> 2. LVS director (keepalived)
> 3. DNAT, SNAT and fwmarks
> 4. Connection synchronization for failover
> 
> I currently have CentOS/RHEL 5 running 1, 2 and 3 above but the RHEL
> 2.6.18-* kernels don't export LVS connections to netfilter resulting in
> lots of INVALID packets on return traffic from real servers.  It also
> prevents connection synchronization to the backup fw/director for
> failover.  Google has been giving me conflicting results on the
> following questions:
> 
> * Do the antefacto patches allow netfilter to access connections managed
> by ipvs and support DNAT, SNAT and fwmarks used in the LVS configuration?
> 
> * Has anyone gotten this to work on RHEL/CentOS via a kernel recompile
> with the antefacto patches?
> 
> If so, is there anything needed beyond the following?:
> 
> 1. Recompile CentOS kernel (2.6.18 ok?) with Antefacto patches
> (http://www.ssi.bg/~ja/nfct/)

The last time that I had a look at the antefacto patch it look to me
like a hack. IIRC, the problem is the LVS design (at least time ago when
I had a look at it) as it bypasses the network stack. This screws up the
possibility of having stateful firewalling and LVS.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
