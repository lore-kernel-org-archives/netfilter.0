From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: RE: urgent - netfilter rejecting 60% of DNS requests!
Date: Thu, 02 Oct 2003 05:44:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.0.20031002054252.01123ec8@fluent2.pyramid.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C406@wardrive.citadelcom
 puter.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C406@wardrive.citadelcom
 puter.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: George Vieira <georgev@citadelcomputer.com.au>, mferrari@decidir.net, "Netfilter list (E-mail)" <netfilter@lists.samba.org>

At 09:31 AM 10/2/2003 +1000, George Vieira wrote:
>Are you sure this isn't a BIND problem and not iptables? If it's iptables 
>then you should log all droped/rejected packets and find out which ones 
>are dropping and why.
>
>Do you have some funky rules like dropping fragmented packets or anything 
>else?
>
>Some BIND servers use TCP instead of UDP to transfer zone info but this 
>may(not) be your problem.. LOG, LOG, LOG and if it doesn't catch it then 
>it's probably a BIND issue..

Another possibility is that the DNS request-response cycle is taking longer 
than conntrack allows.  I have not found a way to tune this.  If you 
suspect this is a problem, consider dropping stateful inspection for DNS 
packets and use pure packet filtering rules to see if that fixes the problem.

Some of the DNS lookups from dig are taking upwards of 30 seconds with some 
DNS servers.

Satch



-- 
"The beautiful part of writing is that you don't have to get it right the 
first time, unlike, say, a brain surgeon." --Robert Cormier  


