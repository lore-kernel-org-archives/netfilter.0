From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: FTP Connection problems.
Date: Wed, 25 Aug 2004 09:16:36 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412C9F44.4090408@pbl.ca>
References: <D5C9032B2B09C64EA2409D6214E91AC90512CF@asimail2.alphanumeric.com>
	<1093442289.1825.56.camel@lbedlbxl.dev.xtra-net.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093442289.1825.56.camel@lbedlbxl.dev.xtra-net.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Vincent Blondel wrote:

> 15:52:48.597025 iptables.33254 > 192.168.124.1.auth: S
> 4154447273:4154447273(0) win 5840 <mss 1460,sackOK,timestamp 1692755
> 0,nop,wscale 0> (DF)

There you go.  Ident lookup (auth is tcp/113, which is ident service). 
It was blocked by your firewall rules, so you had that delay before it 
timed out.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

