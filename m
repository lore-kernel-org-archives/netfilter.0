From: a.ledvinka@promon.cz
Subject: Re: RFC 1035 Bind
Date: Tue, 9 Nov 2004 22:10:06 +0100
Message-ID: <OF126E9AEB.2741841F-ONC1256F47.006CCB1D-C1256F47.0074485C@promon.cz>
References: <20041109190202.GB18755@marschmellow.homeunix.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041109190202.GB18755@marschmellow.homeunix.net>
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
Content-Transfer-Encoding: 7bit
To: Mark-Walter@t-online.de
Cc: netfilter@lists.netfilter.org

> As I understand RFC 1035 answering packet's over TCP are truncated
> at a limit of 512 bytes but it could be more ...
there is no such limit for tcp. for udp don't forget to look at eDNS 
definition.

> Isn't it the comparing this document the best way while using 
> UDP to DROP TCP packets over port 53 and to allow only UDP port 
> 53 at it does not use the IP protocol ?
both queries and answers are limited. udp - length in udp header. tcp 
length of query before query itself. so you just can't have answer or 
question longer then 65535 bytes but that's without udp/tcp/ip headers. so 
tcp can carry queries which udp can't because of size limits...

but anyawy if you need zone transfers you can't live without TCP unless 
you use other mechanism to transfer dns zones.

> but generally I would like prefer to avoid TCP over port 53 concerning
> to avoid a man-in-the-middle attack.
see DNS_ALG rfc 2694, dnsmasq project and maybe some day you will be able 
recover alpha quality code for dns(udp) nat in 2.2.12 kernel hooked into 
ipchains from web.archive.org - it's not limited to masqurading setup. it 
could be used for any nat you could setup.

here are the most relevant parts of rfcs you should not miss before you 
ever try to limit size of dns on udp.

taken from rfc 1035:
Messages carried by UDP are restricted to 512 bytes (not counting the IP
or UDP headers).  Longer messages are truncated and the TC bit is set in
the header. 
(see 2.3.4. Size limits)

taken from rfc1035:
Messages sent over TCP connections use server port 53 (decimal).  The
message is prefixed with a two byte length field which gives the message 
length, excluding the two byte length field.  This length field allows
the low-level processing to assemble a complete message before beginning
to parse it.
(see 4.2.2. TCP usage) 

parts of RFC 2671 
2 - Affected Protocol Elements
2.3. DNS Messages are limited to 512 octets in size when sent over UDP.
     While the minimum maximum reassembly buffer size still allows a
     limit of 512 octets of UDP payload, most of the hosts now connected
     to the Internet are able to reassemble larger datagrams.  Some
     mechanism must be created to allow requestors to advertise larger
     buffer sizes to responders. 

4 - OPT pseudo-RR
4.1. One OPT pseudo-RR can be added to the additional data section of
     either a request or a response.  An OPT is called a pseudo-RR
     because it pertains to a particular transport level message and not
     to any actual DNS data.  OPT RRs shall never be cached, forwarded,
     or stored in or loaded from master files.  The quantity of OPT
     pseudo-RRs per message shall be either zero or one, but not
     greater. 

4.5.3. The requestor's maximum payload size can change over time, and
       should therefore not be cached for use beyond the transaction in
       which it is advertised.
4.5.4. The responder's maximum payload size can change over time, but
       can be reasonably expected to remain constant between two
       sequential transactions; for example, a meaningless QUERY to
       discover a responder's maximum UDP payload size, followed
       immediately by an UPDATE which takes advantage of this size.
       (This is considered preferrable to the outright use of TCP for
       oversized requests, if there is any reason to suspect that the
       responder implements EDNS, and if a request will not fit in the
       default 512 payload size limit.) 


