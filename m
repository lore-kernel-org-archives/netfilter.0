From: Jon Lewis <jlewis@lewis.org>
Subject: ebtables strangeness
Date: Fri, 14 Sep 2012 15:30:01 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.1209141441290.4715@soloth.lewis.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a ubuntu 10.04.4 system (2.6.32-41-server kernel) running a bunch 
of VMs under KVM.  To keep everyone honest, I have ebtables rules (an 
individual input chain and output chain for each VM) that keeps the VMs 
from doing any IP spoofing and blocks a few other sorts of undesirable 
traffic.  On the INPUT, OUTPUT, and FORWARD chains, I have rules to jump 
traffic to the individual VM chains based on input || output interface. 
i.e.

ebtables -t filter -N test-vmi
ebtables -t filter -N test-vmo
ebtables -t filter -A INPUT -i test-vm -j test-vmi
ebtables -t filter -A FORWARD -i test-vm -j test-vmi
ebtables -t filter -A FORWARD -o test-vm -j test-vmo
ebtables -t filter -A OUTPUT -o test-vm -j test-vmo

Actual rules for test-vmi and test-vmo chains omitted, as I don't think 
they're relevant.

I've noticed recently that traffic destined for one VM may show up (in 
counters and can be seen clearly via --log-ip) in another VM's (or several 
other VMs') chains.  Specifically, I've seen this with the rules used to 
block outgoing SMTP traffic (and incoming return traffic from outgoing 
SMTP).  We block SMTP by default and unblock it for individual VMs as 
needed.  I'm seeing return traffic from legit SMTP sessions from one VM 
show up in the ebtables rules (via counters and --log-ip in other VM input 
chains).  It doesn't appear to be causing problems for the VMs actually 
doing outbound SMTP, but it is very disconcerting.  I'm wondering if this 
is a known issue (perhaps already fixed in later kernels)?

----------------------------------------------------------------------
  Jon Lewis, MCP :)           |  I route
  Senior Network Engineer     |  therefore you are
  Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
