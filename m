From: "Vosburgh, Brian P, CTR, WHS-BB" <bvosburgh@whs.mil>
Subject: ip_conntrack question
Date: Mon, 8 Jul 2002 11:31:41 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <86E43FEDC7E2D411B9610002A50900EB8819AF@ddsmttayz076.ref.whs.mil>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

What are the session timeout controls with ip_conntrack?  I'm load balancing
two netfilter (2.4.18 kernel, 1.2.5  ipt) boxes infront of a web server farm
and I'm seeing an avg of 362 connections (GET's) per second, slabinfo
reports 26k on one and 34k on the other.  What is ip_conntrack's definition
and criteria for a "connection"?  How do they expire?  How can I expire
them? etc.

I have the same sorta issue with my BigIP's, the connection table is full of
dead crap and there is no way (@ least F5 can't tell me) how to kill dead
connections.  It's not as big of a deal with these netfilter boxes, however
I'm trying to get an accurate count of how many customers are hitting the
servers.

tia/

Brian Vosburgh
WHS Network Engineering
Work: 703-614-4888
Cell: 703-867-2317

"Life isn't about success.  It's about significance."
- Michael Slaughter


