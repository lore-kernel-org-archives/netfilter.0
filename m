From: Jeroen Vriesman <j.vriesman@prompt.nl>
Subject: connmark on a bridge
Date: Tue, 24 Feb 2004 13:04:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040224130416.2184714d.j.vriesman@prompt.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,

I've installed the connmark patch on a 2.4.24 kernel with ebtables patch, working as a bridging firewall, and I want to mark a tracked connection.

At the moment I've got the following FORWARD in the mangle table:

# iptables -t mangle -L FORWARD -n -x -v

Chain FORWARD (policy ACCEPT 9861 packets, 5242217 bytes)
    pkts      bytes target     prot opt in     out     source               destination
     483    66527 CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0          CONNMARK restore
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          MARK match 0xa
       0        0 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:20 MARK set 0xa
      52     2933 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:21 MARK set 0xa
       0        0 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp spt:20 MARK set 0xa
      40     4404 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp spt:21 MARK set 0xa
     473    65999 CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0          CONNMARK save

I've also tried it in PREROUTING and POSTROUTING
The packets with sport/dport 21 or 20 do get marked, but as soon as I start a regular frt data transfer, these packets don't get marked.
As you can see in the ACCEPT mark=0xa line, the CONNMARK restore doesn't seem to mark any packets (this is after a file transfer).
The example on the connmark website has the same result.

I wonder, is this a problem with connection tracking on a bridge, or is it the connmark module which has a problem on the bridge, or am I not getting it at all?

Kind regards and thanks in advance,
Jeroen Vriesman.

