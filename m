From: Adam Rice <adamrice@ntlworld.com>
Subject: per-connection byte counts
Date: Sun, 18 Jan 2004 14:09:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040118140903.GA3351@glympton.airtime.co.uk>
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

I'd like to be able to get per-connection byte-counts from the kernel, so I
can create a sort of top program showing what processes and users are
currently using the network and how much. Since I want this to be something I
can keep running all the time, I don't want to do it by snooping the
interface. Is there some way to do this with netfilter? Sadly
/proc/net/ip_conntrack doesn't appear to provide this information.

Thanks,
  Adam

-- 
Adam Rice -- adamrice@ntlworld.com -- Blackburn, Lancashire, England

