From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: "iptables: Invalid argument" with kernel 2.4.20
Date: Tue, 17 Dec 2002 03:19:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFE89B0.7030607@fugmann.dhs.org>
References: <GOEDLKDBKHLHGAKAGFGKEEJJLLAA.rsterenborg@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GOEDLKDBKHLHGAKAGFGKEEJJLLAA.rsterenborg@xs4all.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Sterenborg <rsterenborg@xs4all.nl>
Cc: netfilter@lists.netfilter.org

Rob Sterenborg wrote:
> Could someone tell me when I would want to use "-m udp" ? I searched a
> bit and found a lot of scripts using it but didn't find anything that
> explains it.
The '-m' flag means match extentions. '--protocol udp' implicit loads 
the match extentions for the udp protocol, and thus:
'iptables -p udp', is the same as iptables -p udp -m udp'. See 'match 
extentions' in the iptables manpage for more information.

Regards
Anders Fugmann
--
Author of FIAIF
FIAIF is an intelligent firewall
http://fiaif.fugmann.dhs.org


