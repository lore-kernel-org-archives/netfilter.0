From: Brent Gregersen <gregerse@chemsun.chem.umn.edu>
Subject: work ip address at home
Date: Wed, 22 Oct 2003 12:08:26 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031022112801.V34090@chemsun.chem.umn.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I need help with the following setup.

I have one machine at home that gets an IP address (say 1.2.3.4) by DHCP
from an ISP. However, I would like applications on my home machine to
think it has the ip address of my machine at work (say 4.3.2.1).
I would then like to forward a specific port of my home machine to my work
machine, and then forward that to a license server at work. Thus,
application thinks I'm at work, license server thinks Im at work, but Im
really sitting comfortably in my own home.

Is this possible? Should this be done with netfilter/iptables or should I
be looking at another option?

If it is possible, I could get some extra work done at home, without
having to use certain graphics intensive programs over a tunneled X
connection to my work machine(which is extreamly slow).

A diagram:

        LinuxA                 LinuxB            LinuxC
|---------HOME---------|     |---Work--|     |-Work Server-|
|'4.3.2.1' <--> 1.2.3.4|<--->| 4.3.2.1 |<--->|   4.3.2.2   |
|----------------------|     |---------|     |-------------|


Thanks for any help/suggestions

