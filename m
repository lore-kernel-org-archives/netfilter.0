From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: connection dropouts
Date: Wed, 25 Feb 2004 19:05:27 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Aw4LY-001AoE-0V@alf1.lmb.internal>
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


Hi all,

We are currently using iptables 1.2.5 and kernel 2.4.18 to do filtering
and NAT. There are about 800 hosts behind the firewall, and we are in
the process of moving them into private ip space (10.x.x.x) so not all
the 800 are NAT candidates, only about 400 so far. The rest still have
their global ip addresses.
Users are starting to report that when their machine is moved to
10. space, they experience network hangups when accessing offsite
servers (mainly web/ftp but also ssh) and I'd like your advice 
where I should start looking. 

The firewall box is a 1GHz AMD with 128MBytes mem, and
/proc/sys/net/ipv4/ip_conntrack_max is currently set to 8184.

How can I track how close I get to this limit? 
What is the memory use per conntrack entry?
Is there anything particular about NAT entries in the conntrack
tables that would make NAT'd hosts more prone to net hangups
that unNAT'd ones?
If I raise my ip_conntrack_max value, am I likely to crash
the firewall if I raise it too high?
What is the theoretical maximum number of conntrack entries?
What is the theoretical maximum number of NAT connections?
(this would seem to me to be 65536 - the maximum number
of ports available on a single host, i.e. the NAT box
since it has to map a source host:hostport into a NAT:natport)

Sorry for all the questions, but I'm starting to get worried
that we may have bitten off more than we can chew here...

TIA,
Terry.

