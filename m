From: "Waqar Mohsin" <wmohsin@stanford.edu>
Subject: libipq not working with Fedora Core 2
Date: Fri, 28 May 2004 13:08:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01dc01c444ef$91472d50$72292e81@na.qualcomm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

Has anybody tried libipq on Fedora Core 2. I'm using the sample ipq_client.c
and its not working. The call to ipq_read() blocks forever even when there
is traffic being forwarded.

I'm setting up iptables as follows:

# iptables -F
# iptables -A FORWARD -j QUEUE

Has anything changed with the Fedora Core 2 release ?

Waqar


