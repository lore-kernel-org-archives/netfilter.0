From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Un-MASQ'd Packets
Date: Fri, 25 Oct 2002 11:14:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210251015.g9PAF0e05689@vulcan.rissington.net>
References: <36337.192.168.7.14.1035536018.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <36337.192.168.7.14.1035536018.squirrel@iw.k1k2.com>
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

On Friday 25 October 2002 9:53 am, Andrew Smith wrote:

> I can't seem to work out how to identify the packets coming back matching
> outgoing MASQUERADE packets:
>
> iptables -t nat -A POSTROUTING -o $inetif -s 192.168.a.b -j MASQUERADE
>
> this of course MASQUERADE's 192.168.a.b to my outgoing DHCP IP address
> on the device $inetif (yes it works fine :-)
>
> I'd like to be able to count incoming packets/bytes to 192.168.a.b
> that are of course just replies back to 192.168.a.b since nothing
> will actually be able to connect to 192.168.a.b (I have no DNAT/SNAT
> rules to these machines) so I want something like:
>
> iptables -A FORWARD -i $inetif -d 192.168.a.b -j ACCEPT
>
> but of course this isn't correct

Why not ?

> When I count the packets/bytes going out from 192.168.a.b I do that in
> the FORWARD table (well actually a table I create that comes from the
> FORWARD table)
> so it could be just the following for simplification:
> iptables -A FORWARD -o $inetif -s 192.168.a.b -j ACCEPT

Yes that looks good.

> I really have no idea how to identify the return packets after
> they have been de-MASQUERADEd (of course they will have the DCHP
> address in the FORWARD table

No they won't.   Destination NAT (which is the reverse of Masquerading, since 
this is a special form of Source NAT) is performed in the PREROUTING table, 
which comes before the FORWARD table.

All packets you see in the FORWARD table have their "real" destination 
address.

You might be interested to know that you can also create rules with no 
target, eg:

iptables -A FORWARD -d 192.168.a.b

which does nothing as far as ACCEPTing, DROPping, REJECTing etc the packets, 
however it will still count them for you, so if you want to count all the 
packets without autpomatically ACCEPTing them at the same time, you don't 
have to put the -j ACCEPT on the end of your command.

Antony.


-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

