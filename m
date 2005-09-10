From: "Deepak Seshadri" <d_s123@hotmail.com>
Subject: CLASSIFY target confusion
Date: Sat, 10 Sep 2005 14:08:46 -0400
Message-ID: <BAY107-DAV15EE440C9687F21C6C112CB79B0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello everybody,
Here is a snippet from my script:

*mangle
-A POSTROUTING -o eth0 -s 10.0.2.0/24 -j router
-A router -j CLASSIFY --set-class 1:21
-A router -p tcp --dport 80 -m layer7 --l7proto exe -j CLASSIFY --set-class 
1:23
-A router -j ACCEPT

As you see above:
- All packets from 10.0.2.x will jump to the chain "router"
- Here it gets classified to TC's class 1:21
- But if the packet matches the layer-7 policy "exe", it will get classified 
to TC's class 1:23
- Accepted

What happens is:
Those packets that match the "exe" pattern does not get classified to 1:23. 
They still go through 1:21. I thought the packets matching the "exe" pattern 
will take the CLASSIFY target mentioned on the third line (1:23). Even 
though they match the third rule, they still retain the class 1:21. Could 
someone please help me here?

Through conntrack I verified that the connections are being detected by the 
exe pattern matching rule but that connection still flows through 1:21 
class.

Thank you,
Deepak 

