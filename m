From: "Mussie Gebregziabiher" <mussieg@comcast.net>
Subject: tcpdump and iptables ..
Date: Sat, 6 Mar 2004 10:59:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD1B6DC5FFF43C4888DCC155FE8C1FFE70CC74@7xch10ka.sevenspace.local>
References: <FD1B6DC5FFF43C4888DCC155FE8C1FFEBC0EB5@7xch10ka.sevenspace.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD1B6DC5FFF43C4888DCC155FE8C1FFEBC0EB5@7xch10ka.sevenspace.local>
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

Dear All,

When I run tcpdump I seem to be getting data after it is being processed by
iptables.   Can someone tell me where 'tcpdump' resides in the order of
priority?  Have the packets I'm seeing been subjected to 'PREROUTING' rules
such as 'MANGLE' and 'NAT'?  

Thanks in advance. 
Mussie G.


