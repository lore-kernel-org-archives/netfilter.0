From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Unknown error.
Date: Fri, 11 Aug 2006 17:05:08 +0800
Message-ID: <038301c6bd25$3e536450$0100a8c0@newlife>
References: <44DB6E37.8040104@expertron.co.za>
	<01ae01c6bd14$eac34860$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


Cheers.
From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>


> 
> I don't think you can perform CONNMARK on the INPUT chain
> of the filter table, try doing it on the mangle table :-
> 
> /usr/local/sbin/iptables -t mangle -A INPUT -j CONNMARK --save-mark
> 

Hmm I issue the commands on the filter table and INPUT chain on my system,
it seems to work too. And therefore your error is likely due to iptables not 
compiled against the correct kernel source.





