From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Followup on Checkpoint VPN through Iptables
Date: Thu, 26 Sep 2002 15:31:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209261431.g8QEVfv29808@vulcan.rissington.net>
References: <5.1.0.14.2.20020926073737.00acd7f0@pop.mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20020926073737.00acd7f0@pop.mindspring.com>
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

On Thursday 26 September 2002 1:03 pm, David A Golden wrote:

> I've got Checkpoint SecuRemote working from a windows client to my office
> Checkpoint firewall through a linux netfilter firewall/router/NAT box
> without having to specify a specific client on the internal network in the
> pre-routing.

> Voila.  It worked.  I'm not sure if all of this is necessary (e.g. the AH
> protocol bit) but I haven't had the time/chance/inclination to do a
> methodical trial and error test of shutting off each rule to try and break
> it.

You shouldn't need to remove the rules to see what breaks - simply try doing:

iptables -L -n -x -v

which will list the rules and give you packet / byte counters to show which 
ones have matched packets going through the system.   You can then tell if 
any of the rules seem unnecessary, because those counters will remain at zero.


Antony.

-- 

This email was created using 100% recycled electrons.

