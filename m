From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: tcpdump and Iptables
Date: Thu, 2 Sep 2004 19:07:05 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040902180705.GG3755@metastasis.org.uk>
References: <41375ED1.5090400@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41375ED1.5090400@kdtc.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Sep 03, 2004 at 01:56:33AM +0800, CC wrote:

> If I have iptables running and I do a tcpdump -i eth0,   at what point
> is tcpdump listening to the connection?

tcpdump will see the packets before IPTables does anything to them.

-- 
mors omnia vincit

