From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: Does IPTables have a 1:1 port-forwarding capability for a DNAT port-range ?
Date: Thu, 12 Dec 2002 16:34:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c2a23f$619ffef0$0100a8c0@zultys.com>
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


Reposting without all the MIME attachments - my apologies for the crud
from Outlook. Here's my question again in plaintext.

DNAT:
 
Is it possible to have a SINGLE (DNAT?) rule that will let me do 1:1
port-forwarding over a range of ports while doing Destination NAT.
 
e.g. Any incoming connections to 64.1.0.20:100-101 need to be mapped to
172.16.0.100:200-201 for the TCP protocol.
 
such that a connection to port 101 will ALWAYS map to port 201 and a
connection to port 100 will ALWAYS map to port 200.
 
Under current DNAT port range scenario, the connection goes to the
lowest port that is free e.g. a port 101 connection will be DNATt'ed to
port 200 if port 200 is free.
 
The reason for wanting a 1:1 rule is for X windows and other fat port
ranges. Dont want hundreds of rules in there if one can do the job. Can
IPTables do it ? If so how ? If not, I guess I'll have to get in touch
with the developers for tips on a good starting point.
 
Thanks in advance,
Ranjeet Shetye.



