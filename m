From: Mark Seamans <marks@crvinc.com>
Subject: using iptables for "route mapping"
Date: Mon, 24 Mar 2003 13:49:41 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303241349.41852.marks@crvinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Has anyone used iptables (realm support) to act like Cisco's route mapping?
IE:  Using it as a core ISP router with multiple uplinks.  Route source ip A 
to gateway X, while routing source ip B to gateway Y.

I have played around with iproute2's tables and rules with no success.

Mark

