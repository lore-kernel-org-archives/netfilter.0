From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: IPSec through my firewall
Date: Tue, 15 Feb 2005 08:38:33 -0700
Message-ID: <42121779.4000907@utilitran.com>
References: <87vf8ui0g9.fsf@helmut.nilsson.homedns.org>	<42120B2E.9020802@utilitran.com>
	<87vf8tq2fx.fsf@helmut.nilsson.homedns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <87vf8tq2fx.fsf@helmut.nilsson.homedns.org>
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
To: Ola Nilsson <ola@fam-nilsson.org>, netfilter@lists.netfilter.org

Hello,

	This all depends on your implementation, I believe the standard 
protocol 50 (ESP) traffic still does not support NAT. But there are a 
lot of vendors out there that have NAT "aware" VPN devices.

Some devices use UDP encapsulation, others allow a more relaxed version 
of the IPSEC protocol to handle the NAT.

Some only support NAT during one point in the connection, so both the 
client and server can't use NAT, only one or the other.

 From the RFC's:

--snip--
Negotiation of the NAT-Traversal Encapsulation

    The negotiation of the NAT-Traversal happens by adding two new
    encapsulation modes.  These encapsulation modes are

    UDP-Encapsulated-Tunnel         3
    UDP-Encapsulated-Transport      4

    It is not normally useful to propose both normal tunnel or transport
    mode and UDP-Encapsulated modes.  UDP encapsulation is required to
    fix the inability to handle non-UDP/TCP traffic by NATs (see
    [RFC3715], section 2.2, case i).

    If there is a NAT box between hosts, normal tunnel or transport
    encapsulations may not work.  In this case, UDP-Encapsulation SHOULD
    be used.
--snip--

I would allow all traffic between the client and server on UDP ports 500 
and 4500.

iptables -I -i EXT_FACE -o VPN_FACE -d X.X.X.X -p udp --dport 500 -j ACCEPT
iptables -I -i EXT_FACE -o VPN_FACE -d X.X.X.X -p udp --dport 4500 -j ACCEPT

Michael.

Ola Nilsson wrote:
> Hie,
> 
> I would've tried something different if I had the possibility to
> choose. This is a solution chosen by the company I work for.
> 
> Are you sure about that IPSec can't be NATed? NAT-T is kind of meant to
> handle just that. Also, my colleagues have no trouble through
> e.g. D-Link routers. The ISAKMP part NATs just fine...
> 
> Regards,
> /Ola
> 
> Michael Gale <michael.gale@utilitran.com> writes:
> 
> 
>>Hello,
>>
>>	You can not NAT ESP (protocol 50) traffic. Some IPSEC clients
>>and servers support NATing but I believe this requires special
>>implementation on the client and server end.
>>
>>If you want to NAT a VPN tunnel I suggest you try a SSL base
>>VPN. OpenVPN works well, you could also try TCP or UDP encapsulation
>>to help get around the NAT issue.
>>
>>Michael.
> 
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

Hey, let me file that under important .... > /dev/null
...
"Hey did you read my e-mail"
"Let my check"
^From:.* > /dev/null
"Nope, I missed it, send it again"

