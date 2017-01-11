From: Jiri Kosina <jikos@kernel.org>
Subject: conntrackd: synchronization failures
Date: Wed, 11 Jan 2017 21:06:32 +0100 (CET)
Message-ID: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: info@jablonka.cz

Hi,

I've tried to use conntrackd to provide full connection tracking for 
firewalling and NAT in an asymmetric routing situation, but unfortunately 
the synchronization is failing quite often.

The setup is rather simple:

		  /  Internet  \
		 /		\
		RS1 <conntrackd> RS2
		   \	       /
		     \	LAN /
			
RS1 and RS2 have the same netfilter rules applied. RS1 is mostly used for 
sending outgoing traffic from LAN to Internet, while RS2 is mostly used 
for packets coming from Internet to LAN (LAN is mostly "consumer", so the 
Internet->LAN traffic is of a much higher volume (~1Gbps spikes) compared 
to ~200Mbps of outgoing traffic).

RS1 and RS2 are connected via direct link (~0.06ms) which is reserved for 
conntrackd.

conntrackd.conf can be found below.

The issues:

- minor: every few minutes, error message of either of the two forms below 
  appears in the log

	(pid=11083) [ERROR] inject-add2: File exists
	        tcp      6 120 FIN_WAIT src=10.33.12.15 dst=116.31.116.30 sport=22 dport=44232 [ASSURED]
	(pid=11083) [ERROR] inject-add2: Device or resource busy
		tcp      6 300 CLOSE src=10.33.40.102 dst=216.58.201.110 sport=53660 dport=443 [UNREPLIED]

  etc. (states, IPs, ports differ).

- major: roughly once in a few hours the frequency of these messages on 
  one of the router (usually RS2) starts spitting the 'File exists' messages
  much more frequently, and the traffic on the dedicated link 
  dramatically decreases for some reason (IOW conntrackds stop syncing as 
  they were before, while the actual 'data' traffic between LAN and 
  Internet is still the same). This is how the traffic on dedicated link 
  looks like when the issue appears:

	http://www.jikos.cz/jikos/junk/conntrackd.jpg

  the down-spike is where connections between LAN and Internet start to 
  fail (no ACKs coming back from SYNs, etc, as RS2 is dropping everything 
  due to conntrack being out of sync), and the up-spike, bringing things 
  back to normal, is where either conntrackd is restarted, or the incoming
  traffic is cut (by shutting BGP sessions down).

I don't really have a good trial-test environment, as this is happening on 
a production network that is hard to emulate.

Any ideas what might be causing this, or any hints to to efficiently (and 
non-disruptively) debug the issue?

Thanks,

-- 
Jiri Kosina <jikos@kernel.org>
SUSE Labs
