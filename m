From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MASQUERADE for 2 Internet connections
Date: Mon, 9 Sep 2002 13:16:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091216.g89CG9v05332@vulcan.rissington.net>
References: <005a01c257f7$e2e51dc0$6e69690a@rimas>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005a01c257f7$e2e51dc0$6e69690a@rimas>
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

On Monday 09 September 2002 12:56 pm, Rimas wrote:

> Hi folks,
>
> I have configured NAT for 1 Inet connection :
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE - working solution
>
> I use 10.105.105.x internal IP addresing
>
> Now I have a second one Inet connection (eth2).
>
> How to make MASQUERADE like this:
> 1st Inet - MASQUERADE for 10.105.105.100-105
> 2nd Inet - MASQUERADE for 10.105.105.xx for all except 100-105

MASQUERADING is not your problem.   All you need to do is have two rules:

iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE
iptables -A POSTROUTING -t nat -o eth2 -j MASQUERADE

That will masquerade all packets going out of the two external interfaces.

The tricky bit is to get your routing to direct packets from 
10.105.105.100-105 via eth0 and to direct packets from the rest of 
10.105.105.0/24 via eth2.

To do this you need to investigate iproute2 
http://defiant.coinet.com/iproute2

It's not difficult - but it's not netfilter.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

