From: "subramoni padmanabhan" <smoni77@hotmail.com>
Subject: question about iptables
Date: Thu, 27 Feb 2003 19:23:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY2-F97bJeQvFFleSI00046a04@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi,

   I have a question about the use of iptables. I am working on a project in 
which I have to capture packets. Does iptables allow non-obtrusive packet 
capture? For example, if there is a router between A and B and when I send a 
packet from A to B, the router is supposed to make a copy of the packet 
going through it and send that copy to another node, say C without altering 
the packet going to B. So in effect the packet becomes two at the router and 
one goes to C and the original one goes to B. Is there provision in iptables 
to do such a thing? Also, can I capture packets based on the data fields 
inside the packet rather than on the fields in the packet header? If so, 
please let me know how. Any response would be greatly appreciated. Thanks.

Subramoni Padmanabhan
G-126, 700 woodland avenue
Lexington, Kentucky 40508
Phone : 859 323 9405




_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail


