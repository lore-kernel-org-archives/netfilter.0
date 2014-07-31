From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: multicast traffic no longer working after reboot
Date: Thu, 31 Jul 2014 15:22:52 +0200
Message-ID: <53DA432C.7050907@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
today a couple of Hypervisors got restarted due to a power outage. While
the systems and the VMs on the are running fine multicast traffic
between the guests is no longer working.

I generate multicast udp packet using iperf in the guest and check on
the host using tcpdump:

tcpdump vnet0 => multicast packets are visible
tcpdump vlanbr8 => multicast packets are visible
tcpdump em1.8 => no multicast packets visible

vlanbr8 is the bridge, vnet0 the interface of the guest and em1.8 the
physical interface for vlan 8.

I compared the settings in /sys/class/net/vlanbr8/bridge/multicast_*
with a system where multicast works fine and see no differences. brctl
showstp also shows "mc router" to be 1 for both interfaces and the
bridge. All settings in /proc/sys/net/bridge/* are 0.

Any ideas why the bridge doesn't seem to forward multicast packets?
iperf with unicast udp also works fine so it's just multicast that is
the problem.

Regards,
  Dennis
