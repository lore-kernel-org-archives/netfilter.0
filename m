From: Jason Opperisano <opie@817west.com>
Subject: Re: cannot outgoing smtp with snat
Date: Fri, 24 Sep 2004 12:46:49 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096044409.9581.82.camel@wolfpack.ljm.dom>
References: <89045C600CF2D74F8B98B9A25B1E9D850488F5@procor.internal.broadnet.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <89045C600CF2D74F8B98B9A25B1E9D850488F5@procor.internal.broadnet.es>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-24 at 04:38, Higuera, Antonio wrote:
> Hi,
> I have a linux iptables fw with two interfaces: internal and external
> (nating the internal traffic) with a public ip. In the internal
> interface I have a ms exchange server that forward all the external mail
> to the firewall via smtp.
> - After setup the linux fw I had a cisco router nating the traffic to
> internet and everything went fine. It seems therefore that the exchange
> server works properly.
> - With the linux machine everything works fine unless the outgoing
> smtp.I can telnet the port 25 of the external server but something
> happen once the smtp protocol has begun. In fact I can see with a
> sniffer that the protocol stop when the external server send back DATA.
> In this moment the local exchange stop of sending and the timeout is
> reached.
> - I tested other smtp applications to send out messages and work fine
> with iptables. But what happens with exchange?: works with cisco but not
> with iptables!! It's crazy!!!
> Any ideas?
> Thank you for your help

posting your rules might help:

iptables -t mangle -vxnL && iptables -t nat -vxnL && iptables -vxnL

-- 
Jason Opperisano <opie@817west.com>


