From: "G. Georgiev" <ggeorgiev@videotron.ca>
Subject: Changing destination address after routing.
Date: Tue, 18 Mar 2003 23:15:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303182315.22433.ggeorgiev@videotron.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

	Hello,

	I have quite a particular routing / masquerading problem I explain in an 
early message to this list. My problem may be solved if there is a way to 
modify packet destination address AFTER the routing has taken place. I want 
the routing mechanism to choose the outgoing interface and after that change 
the address of the destination machine - a bizzare situation, but read the 
message I posted few hours earlier.

	Is really a way there to do that with iptables, or a similar tool / approach?

	George.

