From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: will port forwarding work here?
Date: Fri, 14 Jan 2005 12:10:08 -0500
Message-ID: <20050114171008.GA3088@tranquility.scriptkitchen.com>
References: <20050114153508.GA1189@tranquility.scriptkitchen.com>
	<20050114155549.GA26172@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050114155549.GA26172@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

On Fri, Jan 14, 2005 at 10:55:49AM -0500, Jason Opperisano wrote:
> yeah--the same thing that everyone misses when they try and DNAT 
> onto
> the same local network:
> 
> 1) client (192.168.0.100) send TCP SYN to 192.168.0.10 port 3128
> 2) proxyA (192.168.0.10) DNATs the packet to 192.168.0.11
> 3) proxyB (192.168.0.11) receives SYN from 192.168.0.100 and replies
>    directly with SYN/ACK
> 4) client (192.168.0.100) receives SYN/ACK from 192.168.0.11 and drops
>    it, as client never sent a SYN to 192.168.0.11.
> 
> sound familiar?  it feels familiar to me as i type it once again.

Will it help, if I move the second squid proxy to the DMZ in 
10.10.10.3 ?
With warm regards,
-Payal

