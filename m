From: "Joshua, C.S. Chen" <cschen@asiaa.sinica.edu.tw>
Subject: outgoing skype ports
Date: Wed, 18 Oct 2006 13:33:15 +0800
Message-ID: <4535BC9B.1010605@asiaa.sinica.edu.tw>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi folks,
I am maintaining a small office fw/gw using iptables. And the rules are,
only open outgoing connection for port (destination port) 80 and 443.
And stateful allowing returned/concerned sessions.
Now we want to allow skype traffic. My question is
What port(s) should be opened (outgoing) to use skype?

Thanks in advance

Cheers
Joshua


