From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: snat
Date: Mon, 02 May 2005 11:07:38 -0500
Message-ID: <4276504A.7040103@riverviewtech.net>
References: <BAY22-DAV73016DEEEE8DDD0EFAE2FB2270@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY22-DAV73016DEEEE8DDD0EFAE2FB2270@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Marco Berizzi wrote:
> Hello everybody.
> I would like to better understand the SNAT target.
> Man states:
> 
> "You can add several --to-source option. If you specify
> more than one source address, either via an address range
> or multiple --to-source options, a simple round-robin  (one
> after another in cycle) takes place between these addresses.
> 
> I would like to know if this round-robin cycle is per packet
> or per socket.
> 
> TIA

Don't hold me to this, but I think that the SAME target will implement some SNATing across multiple IPs and ensure that any given connection and possibly system will get the ""same source IP (hens the name) as it goes out.  Can any one back me up on this?



Grant. . . .

