From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: blocking servers
Date: Thu, 6 Mar 2003 09:51:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C1F@hslex01.hslbz.local>
References: <1046924708.1182.6.camel@nirvana.flat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1046924708.1182.6.camel@nirvana.flat>
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
To: 'mdew' <mdew@mdew.dyndns.org>, mldonkey-users@nongnu.org
Cc: netfilter@lists.netfilter.org

> Ive been messing with iptables, trying to block the connection o 
> certain mldonkey general servers.
> 
> On my firewall, i used these lines...
> 
> iptables -A FORWARD -s 10.0.0.3 -d 148.216.18.89 -j DROP
> iptables -A FORWARD -s 10.0.0.3 -d 24.128.236.196 -j DROP
> iptables -A FORWARD -s 10.0.0.3 -d 24.132.124.37 -j DROP
> 
> but I still managed to connect to the servers

Did you check on the edonkey-client-box with netstat -an to which
server(s) the clients connect to(and while you're at it what ports they
use) when you can still connect ?

I did something like this once for Yahoo Messenger and it came up with
(I think 3) different ports and *a lot* of servers (someone posted a
nice list of them).


Rob


