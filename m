From: Tim Gardner <timg@tpi.com>
Subject: 2.6.0-test9, bridge firewall, interface specification
Date: Thu, 6 Nov 2003 14:07:23 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311061407.23335.timg@tpi.com>
Reply-To: timg@tpi.com
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

I have a well behaved bridge firewall using 2.4.22 with the relevant P-O-M 
patches applied. In testing 2.6.0-test9 I have determined that interface 
specification on a rule no longer works. For example, the first rule in the 
set that should catch 99% of all inbound TCP packets is

iptables -A FORWARD -i $EXTIF -m state --state ESTABLISHED,RELATED -j ACCEPT

If the interface is specifed, then this rule does not accrue any packets. Is 
this an expected change in behavior from 2.4.22?
-- 
Tim Gardner - timg@tpi.com 406-443-5357
TriplePoint, Inc. - http://www.tpi.com
PGP: http://www.tpi.com/PGP/Tim.txt


