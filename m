From: Mike Benson <mikey@nontoxic.org>
Subject: connection tracking thru 2 or more firewalls
Date: 30 May 2002 20:09:45 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <1022814586.476.20.camel@doobie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org



probly a dumb question but here it goes anyway

just say you have 2 or more iptables firewall boxen set up routing
traffic to eachother internaly and from the out side.
not a problem for the most part.
waset even hard to get vtun to span diffrent network locations
ok here is the issue
 i get lots of dropped ACK packets from the mail server behind the 2nd
firewall. I am asuming thats got to do with the connection tracking
module not getting the related or some thing from the forwarded packets

would be very intrested to hear the lists thoughts on the subject.






