From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Connect to localhost bound port from outside?
Date: Wed, 31 Jan 2007 17:57:29 -0600
Message-ID: <45C12CE9.2000401@riverviewtech.net>
References: <eppgne$mc1$1@sea.gmane.org>	<45C06BE7.2080208@plouf.fr.eu.org>	<45C0B772.2090201@riverviewtech.net>	<45C0BDDE.2030905@plouf.fr.eu.org>	<45C0E06F.3080405@riverviewtech.net>
	<45C11FDC.4030908@plouf.fr.eu.org>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C11FDC.4030908@plouf.fr.eu.org>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Pascal Hambourg wrote:
> You can remove "else". A network card that does not talk to anything.

Ok.

> Yes. But actually you access nothing but void.

Not being able to access any thing but your self is vastly different 
than your data streaming in to /dev/null with no replies.  This is what 
I was trying to imply.  I suppose that I should say that I took what you 
said earlier about dummy being null to say that any traffic you sent to 
ti would be unacknowledged, which is not the case.

> Yes, but doing this you do not access the dummy network. You just access 
> the dummy interface _address_ like any other address owned by that host. 
> The dummy interface nevers sees that traffic. You could do the same just 
> by adding that address to any other interface, including the loopback 
> interface lo.

Hum.

> I am not sure I get what you mean... Maybe an example would help.

dummy0=192.0.2.254
eth0=192.168.1.123
lo=127.0.0.1

iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.123 -p tcp --dport 
1234 -j DNAT --to-destination 192.0.2.254:1234

>> Now, what I'm not sure about is if it would be possible to not use lo 
>> but use dummy in place of it.  I.e. lo is down and down with dummy up 
>> and up with 127.0.0.1 on it.
> 
> Hmm... You don't want lo to be down, else the host cannot communicate 
> with itself any more.

Why would a host not be able to communicate with its self if it is 
trying to communicate from / to 127.0.0.1 if that IP address is on a 
different interface?  Or are there other things that communicate over lo 
with out using IP.  If the latter is the case, have lo up with out an IP 
address.

> The routing code does not say that only 127.0.0.0/8 (not /24) can talk 
> to 127.0.0.0/8. Actually any address allocated to any interface on the 
> host (which I call a local address) can talk to 127.0.0.0/8 and 
> conversely. The routing code says that you can talk to or from 
> 127.0.0.0/8 only through the loopback interface. So giving 127.0.0.1 to 
> another interface won't help.

Hum.

> Huh ? Traffic destined to a local service goes through the INPUT chain, 
> not the FORWARD chain. Whether the IP address you bind the service to 
> belongs to a loopback interface, a dummy interface or any other 
> interface does not make a difference. All local addresses belong to the 
> host and create a local route in the special "local" routing table.

Ok, I think I you and I have a different understanding of how traffic 
traverses the kernel.  I am under the impressions that any traffic that 
is forwarded from one interface to another passes through 
filter:FORWARD.  ....  However, repeating the test that I did earlier 
and looking at the packet counters, you are indeed correct.  This fact 
makes a later part of what I was saying very much moot and / or 
incorrect.  I think my confusion comes from a lack of understanding of 
how IPs translate / relate to Sockets and where services actually bind to.

In light of this new information and the fact that the kernel will only 
allow local sources / destinations to talk to 127.0.0.1, I can only 
think of one thing that will allow the OP to redirect traffic in to the 
127.0.0.1 IP address, that being a proxy of some sort that is running on 
the local host that would initiate a local request for the internal 
service.  I also believe a proxy was previously mentioned in the 
referenced thread.



Grant. . . .

