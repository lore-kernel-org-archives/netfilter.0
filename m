From: "Paul Albert" <palbert@rovingplanet.com>
Subject: Ipables memory footprint
Date: Wed, 30 Apr 2003 10:23:22 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <661F9268BBA8CB4EB92CC12B8C42F06901F623@pluto.rovingplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hi all -=20

I'm running a RH 7.3 box with a 2.4.20 kernel (with the bridge patches)
and iptables v1.2.7a as a bridge.  Last night I received notice that the
machine was out of memory.  After killing all of the java processes that
were running, the machine was still using a substantial amount of memory
(440MB/512MB).  I took the machine to single user mode to see if this
would reduce the memory footprint, but this didn't change things
significantly.

I've run iptables for about a year without problems.  However, some
people belive that it is this code that is causing our problems.  My
questions are as follows:

* Is there a way that I can measure the amount of memory that iptables
is using?

* Is there a way that I can manually flush all of the entries in
/proc/net/ip_conntrack?

* Are there any tools that I could use the monitor the kernel memory
size?

Thanks,
Paul

