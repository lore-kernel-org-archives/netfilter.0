From: Jeffrey C Albro <jalbro@bu.edu>
Subject: Questions on DNAT and pre/postrouting...
Date: Tue, 20 Jul 2004 17:02:35 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0407201652340.20957-100000@signals10.bu.edu>
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


I'm trying to wrap my head around some iptables issues with a failover box
I'm working on.  The failover box has an interface to the outside world, 
and an interface to each server.  

I've read every FAQ and HOW-TO I can get my hands on.  I wish the archives 
of this mailing list was searchable...

Anyways, I have a few questions:

I understand how DNAT works in the prerouting change.  You change the
destination and out the packet goes to the preferred server.  No problemo.  
But when the packet comes back, the failover box appears to SNAT the
packet.  I've seen this referred as un-DNATing.  It makes perfect sense
that due to the client expecting packets back from the address it sent
them to that this is required behavior, but can this be turned off or
controlled?  I just found it odd that this happened with no iptables
rules.

What's up the the "no filtering" guideline for the PRE and POST routing 
chains?  I'm doing it right now and it seems to work fine, but WHY is this 
a problem, and how else would I do it?  It seems that it would result in a 
longer ruleset if I had to do this in the FORWARD chain.  Is lightning 
going to strike me down?

Thanks!

-Jeff


-----------------------------------------------------------
Jeffrey Albro | Systems Administrator | Boston University
   - Department of Electrical and Computer Engineering -
jalbro@bu.edu |  Photonics, Room 305  | 617-358-2785
-----------------------------------------------------------




