From: "David Culp" <dculp@mcleodhealth.org>
Subject: Help - Public Interface seems to go to sleep
Date: Tue, 15 Apr 2003 15:36:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <85256D09.006BAD95.00@nt_domino.mrmc.mcleodhealth.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



I have a dual-homed linux server  (RH 7.3).
     eth0  - private network
     eth1 - public network

     iptables/netfiler:
          Policy :  Deny All
          Eth0    : Accept All
          l0         : Accept All
          Eth1   :
               - Incoming:  Allow only TCP to port 443
               - Outgoing: Allow only established connections

     Problem:
          - Everything works 'most' of the time. However after no
            activity on the public interface for a while (hours), can not
connect.
            But then later, can connect ??
           From a tcpdump trace on eth1, the times that it will not connect
shows
           only SYN packets from the other host, no ACK from this server?

          Have I filtered out too much traffic ?  Should I allow ICMP through
the
          public interface ? Bad ethernet card ?

Thanks for your help,
David







