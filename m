From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Modification to iptables (block IP addresses)
Date: Mon, 28 Oct 2002 18:13:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021028181349.ZEZZ292.mta03-svc.ntlworld.com@there>
References: <Pine.LNX.4.21.1010221832550.715-100000@hybel173.grm.hia.no> <3DBD666D.B80282F6@lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DBD666D.B80282F6@lanl.gov>
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
To: netfilter@lists.samba.org

On Monday 28 October 2002 4:31 pm, rwc@lanl.gov wrote:

> Is anyone working on the following modification to iptables?  Dynamically
> watch for connections coming from any source IP addresses that exceeds a
> predefined number of connections per unit time.  When seen, block all
> subsequent connections from that source for a predefined period of time or
> indefinitely.  Currently, one can do this for specific predefined source IP
> addresses, but it would be good to have the ability to do this without
> having prior knowledge of the the offending IP source.

You might want to investigate the "recent" match in p-o-m.

Antony.

-- 

Software development can be quick, high-quality, or low-cost.

The customer gets to pick any two out of three.

