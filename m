From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ruleset
Date: Tue, 10 Aug 2004 09:27:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408100927.22281.Antony@Soft-Solutions.co.uk>
References: <HAEOIFPIBBBLGLHOMLLIIEPPCGAA.bclark@eccotours.biz>
Reply-To: "iptables" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLIIEPPCGAA.bclark@eccotours.biz>
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
To: iptables <netfilter@lists.netfilter.org>

On Tuesday 10 August 2004 8:22 am, Brent Clark wrote:

> Hi all
>
> If possible would someone be so kind as to have a look at my ruleset and if
> possible, share some pointers.  I have another linux box (Ip address
> 192.168.3.3, connected to eth1 on the FW)  I have a lan (192.168.2.0/24)
> connected to eth0 For my internet handling I have a ppp connection.  Im also
> currently toying with dyndns (ez-ipupdate).

1. For efficiency I would put the ESTABLISHED,RELATED rule first in your INPUT 
chain.

2. I do not entirely approve of running a DNS server on the firewall.   Since 
you have another box availabel on 192.168.3.3 I would suggest running DNS on 
that and redirecting requests (or configuring clients to know what's where to 
find it).

3. I do not think you will see any packets addressed to 192.168.2.255 in the 
FORWARD chain - they would appear in the INPUT chain.   I also think they 
should be logged as "BROADCAST", not as "INVALID".

4. Do you *really* want to allow *all* NEW packets from the Internet to the 
DMZ, no matter what protocol they are?   You might as well simply stick your 
192.168.3.3 machine on a public IP address with no firewall....

5. For efficiency I would put the ESTABLISHED,RELATED rule first in your 
OUTPUT chain.

6. The default DROP policy on OUTPUT is rather misleading (and may give you a 
false sense of security), since the ruleset allows all NEW, ESTABLISHED, and 
RELATED packets.   That means everything which can be part of a connection.

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


