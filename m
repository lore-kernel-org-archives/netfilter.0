From: a.ranu@ugrad.unimelb.edu.au
Subject: window scaling
Date: Wed, 08 Oct 2003 17:37:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310080737.h987bi53024546@cassius.its.unimelb.edu.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi...

i am writing a module that modifies the advertised window in every outgoing 
packet with the help of ip connection tracking, if it is larger than the 
window i calculated (say x - not scaled, just in bytes)

would the following code be correct?

x_scaled = x >> (*pskb)->sk->tp_pinfo.af_tcp.rcv_wscale;
window_already_in_pkt = ntohs((*pskb)->h.th->window);

if (window_already_in_pkt > x_scaled)
        tcph->window = x_scaled;

a reply would be really appreciated

Asmeet.





-- 
a.ranu@ugrad.unimelb.edu.au

