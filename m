From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ssh
Date: Wed, 14 Jul 2004 16:42:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407141642.31591.Antony@Soft-Solutions.co.uk>
References: <2E314DE03538984BA5634F12115B3A4E62E89F@email1.mitretek.org>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62E89F@email1.mitretek.org>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 14 July 2004 4:26 pm, Piszcz, Justin Michael wrote:

> Should all incoming ports that relate to a service such as SSH, FTP use
> -m state --state NEW?

It doesn't really matter, IMHO.

> What are the security implications (if any) of not using -m state
> --state NEW?

Well, there are two types of packets - ones that are NEW, and ones that 
aren't.   If you use "-m state --state NEW" as a match on the rule to allow 
the first packet in (because it's only the first one which will be NEW 
anyway), then you must have some other rule which allows the second and 
subsequent packets in (which are no longer NEW; they are ESTABLISHED).   In 
my opinion it makes no difference whether the rule for the first packet would 
*only* let in the NEW packet, or if it would let in the later ones as well.

Remember that the efficient order to place your rules in the FORWARD chain is:
1. Allow ESTABLISHED & RELATED packets through the firewall.
2. Allow the first packets of selected connection types.

Therefore any ESTABLISHED packets aren't going to get beyond rule 1 anyway, so 
it dosn't much matter whether the rules at (2) allow them or not.

The only other type of packet which you might want to think about is INVALID 
packets, however whether you consider these to be a security risk or not is 
moot, I think.   Even if an INVALID packet were to be allowed through your 
firewall to an internal host, any response would not get back out again 
because it's not part of an ESTABLISHED connection, so unless the INVALID 
packet can actually do some harm all on its own, it seems to me that allowing 
NEW, or allowing all, packets in makes little difference (for a given service 
and destination).

If someone wants to send you an INVALID packet anyway, all they need to do is 
send you a SYN packet to a listening port/address first - that will set up an 
ESTABLISHED connection tracking table entry, and then any further packets 
from the same source IP/port will be FORWARDED through the traditional Rule 
1.

Just my 2c - I will be interested to see any other opinions on the topic.

Regards,

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Koyama Mituru
> Sent: Wednesday, July 14, 2004 10:26 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: ssh
>
> From: "IT Clown" <iptables@mailbox.co.za>
> Subject: ssh
> Date: Wed, 14 Jul 2004 16:15:22 +0200
>
> > How do i allow ssh in from the internet, thanks?
>
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


