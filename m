From: "Vasantha Kumar Puttappa" <vasanthakumar@iitb.ac.in>
Subject: PREROUTING:To update Source and destination IP field (plz reply)]
Date: Tue, 13 Jun 2006 23:03:15 +0530 (IST)
Message-ID: <4344.10.12.25.5.1150219995.squirrel@gpo.iitb.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org.

Dear friends,
  I am new to iptables and libipq. Please somebody reply to this query

  Is it possible to change both source and destination field in an IP
header in PREROUTING. If not, plz somebody suggest me a way to do that.

 Let me explain in detail

 Suppose there are 3 machines A B C. When a packet comes from machine A to
machine B. I would like to capture these packets AT MACHINE B BEFORE it
goes through routing decision. I would like change the source and the
destinatio IP address(modified SOURCE IP = MACHINE B IP, modified
DESTINATION IP= MACHINE C IP)  including the payload, and then pass it to
the routing decision unit.

 Is it possible to implement this using iptables ? if yes,plz let me know.
If not, then plz suggest some ways to do this.


 Thanx in advance



