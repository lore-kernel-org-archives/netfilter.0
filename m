From: "primero@hdr-roma.it" <primero@fastwebnet.it>
Subject: Re: broadcasts to other network?
Date: Tue, 21 Dec 2004 20:54:01 +0100
Message-ID: <41C87F59.8050606@hdr-roma.it>
References: <41C7F5C5.6023137F@knoware.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41C7F5C5.6023137F@knoware.nl>
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
To: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Cc: netfilter@lists.netfilter.org

Frans Luteijn wrote:

>...
>
>But no packets went out, at least that I couldn't see after adding a
>LOG-rule at OUTPUT and FORWARD.
>
>Is there an easy way to solve this or do I need a relaying-program (like
>dhcp)?
>
>Greetings,
>
>  
>
The easiest way, IMHO, is using an UDP-Relay ... i mean, what is more 
simple then a little daemon running smoothly ? ;)

A better and not easy way would be bridging the interface to the 
internal lan with the interface to the router using the same network 
class. This way broadcasts would pass normally from one side of the 
firewall to the other one, you could as well filter traffic beetween the 
two interfaces.

I would choose the latter ;)
bye
primeroz



