From: Richard Doyle <rdoyle@islandnetworks.com>
Subject: Re: Bridging firewall setup
Date: Tue, 16 Dec 2003 09:34:48 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071596088.3559.57.camel@plunker.islandnetworks.com>
References: <3FDF38FF.3090109@wavetex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FDF38FF.3090109@wavetex.com>
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

On Tue, 2003-12-16 at 08:55, Chris Brown wrote:
> Hi all, new to the list. I'm trying to get a bridging firewall setup on 
> a RH 9 box and I'm not having much luck. The bridge itself works fine 
> but when I try to add rules using netfilter they seem to be ignored and 
> packets I'm trying to block go on through. I've been digging through the 
> list archives, google, various forums and HOWTOs and I still haven't 
> found the answer so I'm hoping someone here can point out what I'm doing 
> wrong :)
Did you patch the kernel to support this? The bridging code in the stock
2.4 kernels doesn't support firewalling,



