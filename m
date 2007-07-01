From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: can this be written as one rule ?
Date: Sun, 01 Jul 2007 09:42:53 -0700
Message-ID: <4687D98D.7070105@mailinator.com>
References: <4687C1D4.3090704@gatworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4687C1D4.3090704@gatworks.com>
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
To: netfilter <netfilter@lists.netfilter.org>

U. George wrote:
>> $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.124.176.0/20 -j DROP
>> $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.124.32.0/20 -j DROP
>> $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.127.64.0/17 -j DROP
<snip />
>> And so on ?
> 
You could use ipset:
     http://ipset.netfilter.org

Once a set of type nethash has been created and populated its usage is
very simple.   e.g. To test whether a source|destination address is in a
nethash set named BADNETS use:

     iptables -A INPUT -m set --set BADNETS src|dst -j NETHANDLER

Not sure if this extension is in the kernel yet but it's relatively easy
to add by following the instructions at their website.

:m)


