From: Leonid Veytser <veytser@cs.bu.edu>
Subject: Checksumming Issues
Date: Fri, 21 Nov 2003 15:15:30 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311211514050.16319-100000@csa.bu.edu>
References: <Pine.SOL.4.20.0311111752590.29271-100000@csa.bu.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.20.0311111752590.29271-100000@csa.bu.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

A general question about checksumming. If I change the destination address
in the IP header, then of course I need to recalculate the IP header
checksum. But do I have to recalculate the checksum of the next protocol
header (ie TCP, UDP, etc)?

Thanks.



