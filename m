From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquarede stalls?
Date: Tue, 10 Aug 2004 20:18:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408102018.51515.Antony@Soft-Solutions.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC9051263@asimail2.alphanumeric.com> <20040810205631.797831f1.monk@geotronic.hu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040810205631.797831f1.monk@geotronic.hu>
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

On Tuesday 10 August 2004 7:56 pm, Meszaros Gergely wrote:

> Dear Antony and Jason! Many thanks for the quick response! I'm enthralled.
>
> Unfortunately "tcpdump -n -nn -p -i ppp0 icmp" gives nothing (I hope i did
> it well :)). (what is -nn ? I cannot find that in the manpage.)
>
> Are you sure this is a ICMP related problem? I can ping everything very
> quickly and correctly from the internal net. The things go wrong somewhere
> during the connections. :-( However you must be right, im not guru.
>
>
> Anthony, my ext interface is the following:
>
> ppp0      Link encap:Point-to-Point Protocol
>           inet addr:xxx.xxx.xxx.xxx  P-t-P:192.168.0.254 
> Mask:255.255.255.255 UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492 
> Metric:1 RX packets:2255 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:3300 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0
>           RX bytes:133634 (130.5 KiB)  TX bytes:1083394 (1.0 MiB)
>
> MTU: 1492.  But I dunno it is bad or good :)

That means you cannot put packets bigger than 1492 bytes down the interface.

If you have stupid internal client machines (eg: Windows O/S) which don't 
understand that MTUs between client and server can be less than the local 
subnet, then you will not be able to communicate from those clients without 
changing the MSS (maximum segment size) at the firewall.

> Its less than 1500 bytes, however by only 8. Its bad?

8 bytes is enough to cause the problem.

> And whats  that clamp-mss-to-mtu thing ? :)

iptables -t mangle -A POSTROUTING -o EXTIF -j TCPMSS --clamp-mss-to-mtu

Regards,

Antony.

-- 
Late in 1972 President Richard Nixon announced that the rate of increase of 
inflation was decreasing.   This was the first time a sitting president used 
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the list;
                                                           please don't CC me.


