From: "Dan Searle" <dan@intrago.co.uk>
Subject: Re: Tightening up outgoing traffic
Date: Tue, 15 Oct 2002 15:32:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009b01c27457$a7ab66c0$0800000a@wormhole>
References: <1034686034.15446.38.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi,

>
> I keep getting "domainname can not be found.  Please check the name and
> try again" from my browser.  This only happens for new web sites (i.e.,
> Yahoo works fine).  As this seems somewhat like a DNS issue, I tried
> adding this:
>

That'll be a DNS problem ;-)

> iptables -A OUTPUT -p tcp --destination-port nameserver -j ACCEPT
>
> but it didn't work.  Any ideas?  Thanks.

iptables -A OUTPUT -p tcp --dport domain -j ACCEPT
iptables -A OUTPUT -p udp --dport domain -j ACCEPT

You want to use the service name "domain", not "nameserver", also I think
domain lookups use the udp protocol also. (Don't quote me on that one :-)

Dan...



