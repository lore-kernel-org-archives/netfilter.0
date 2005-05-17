From: "Holger Brueckner [c]" <hb@ciphirelabs.com>
Subject: Re: problem with conntrack loosing state [signed]
Date: Tue, 17 May 2005 12:30:11 +0200
Message-ID: <1116325811.3383.3.camel@localhost>
References: <1114533395.2969.39.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114533395.2969.39.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


just for the record:

problem has been solved by running kernel > 2.6.12-rc3

h.


On Tue, 2005-04-26 at 18:36 +0200, Holger Brueckner [c] wrote:
> hello,
> 
> (please cc, i'm not a regular on the list)
> 
> we're experiencing some strange problems with the conntrack engine
> loosing state. following setup:
> 
> fw with several interfaces
> kernel 2.6.11.X
> iptables v1.2.11 (debian)
> 
> all ips have a /32 netmask so that every traffic is routed through the
> firewall. this is assured by corresponding vlan setup on the switches.
> 
> FORWARD is:
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> DROP       all  --  anywhere             anywhere            state
> INVALID
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> .....
> LOGDROP    all  --  anywhere             anywhere
> 
> eventually after a day or two pakets pakets which should be matched by
> established coming in from the same interface as they go out will get
> dropped and logged.
> 
> e.g.     srv1 --+-- fw -- srv3
>          srv2 --|
> 
> "established" packet from srv1 to srv2 will get dropped after some days.
> it looks like the syn flags don't trigger the conntrack engine although
> the syn "pakets" go through the fw as expected, only pakets with no syn
> flag set get dropped.
> while this is the case the fw works perfectly for host which are not on
> the same interface. so conntrack for connections from srv1 to srv3 or
> srv2 to srv3 work as expected. rebooting the firewall is the only
> solution to the problem.
> 
> there's not very much load on the server yet, last time i checked there
> were about 250 conntrack entries. it looks like this might be realted to
> Daniel Wittembergs "NAT stops working (more)" thread, at least the
> symptoms are quite similar.
> 
> any suggestions to further debug this ? we just upgraded to 2.6.12-rc3
> to see if this is solved. if not we will downgrade and see if this
> happens again.
> 
> holger brueckner
> 
> 
> 
> 



--
------------------------ [ SECURITY NOTICE ] ------------------------
To: netfilter@lists.netfilter.org.
For your security, hb@ciphirelabs.com
digitally signed this message on 17 May 2005 at 10:29:37 UTC.
Verify this digital signature at http://www.ciphire.com/verify.
------------------- [ CIPHIRE DIGITAL SIGNATURE ] -------------------
Q2lwaGlyZSBTaWcuAVduZXRmaWx0ZXJAbGlzdHMubmV0ZmlsdGVyLm9yZwBoYkBjaXBoa
XJlbGFicy5jb20AZW1haWwgYm9keQAJBgAAfAB8AAAAAQAAAJHHiUIJBgAArwIAAgACAA
IAIPIh6RkYmeZcQRIJZYy7b0sQ3bMYMvm8+Po9XBPY0pNnAQAPjqtled7ohMXyims3EKz
yrw6OVIEN+mt2h+UbCMAsTCv2wOnTCiMfYPjb8mnpo4EOy0ccziFlSwuEZM4elmcPU2ln
RW5k
--------------------- [ END DIGITAL SIGNATURE ] ---------------------


