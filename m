From: "Paul Clark" <paul@xmill.com>
Subject: RE: NAT of entire subnets
Date: Sat, 24 May 2003 11:56:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EIEMLBOIBLCDHIEMFNPCOENOCDAA.paul@xmill.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CCF@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CCF@wardrive.citadelcomputer.com.au>
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
To: "Vann H. Walke" <walkev@presearch.com>, netfilter@lists.netfilter.org
Cc: George Vieira <georgev@citadelcomputer.com.au>

George Vieira wrote:
> There is a patch-o-matic patch that does this.. forgotten the name.
> 
> it matches external IPs to internal ones.. so 203.11.11.56 would 
> be 192.xx.xx.56 and so on..

It's NETMAP

http://www.netfilter.org/documentation/pomlist/pom-base.html#NETMAP

Paul



