From: Luis Miguel Cruz <luismi@b2bi.es>
Subject: Re: displaying connections recognized by the conn.-tracking module
 possible?
Date: Mon, 23 Aug 2004 08:29:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41298EDD.2020206@b2bi.es>
References: <200408211759.50531.shirai@kawo1.rwth-aachen.de> <200408221816.53845.Antony@Soft-Solutions.co.uk> <20040823021009.GA7531@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040823021009.GA7531@tranquility.scriptkitchen.com>
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
To: Payal Rathod <payal-netfilter@scriptkitchen.com>, netfilter@lists.netfilter.org
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>

netstat-nat (http://tweegy.demon.nl/projects/netstat-nat/index.html) or
netstat-viewer (http://cv.intellos.net/)

Payal Rathod wrote:

> On Sun, Aug 22, 2004 at 06:16:53PM +0100, Antony Stone wrote:
> 
>>>nat) I mean perhaps a similar output than "netstat -t" does, when showing
>>>all current tcp-connections on a host. Or perhaps is this listed somewhere
>>>in the /proc filesystem?
>>
>>cat /proc/net/ip_conntrack
> 
> 
> On my Mandrake 10.0 machine I get,
> # cat /proc/net/ip_conntrack
> cat: /proc/net/ip_conntrack: No such file or directory
> 
> -Payal
> 

