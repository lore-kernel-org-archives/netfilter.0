From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Thu, 8 Apr 2004 11:20:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404081120.46628.Antony@Soft-Solutions.co.uk>
References: <24002.1081417393@zworg.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <24002.1081417393@zworg.com>
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

On Thursday 08 April 2004 10:43 am, __ Radien__ wrote:

> Thx Antony
>
> But:
> > Circuit level filtering means packet filtering - what netfilter does - in
> > other words you filter packets based on where they've come from and where
> > they're going to (IP addresses), and on *assumptions* about what the
> > TCP/UDP port numbers mean, rather than based on anything that's actually
> > inside the body of the packets (data).
>
>   I read it's sth more than packet filtering, and it work on session
> layer. Working on session layer is a little hard for me to underestand.
> I'm looking for some example.

I don't blame you for being confused.   The session layer (and the 
presentation layer) of the OSI model are very hard to explain what they're 
for.   I have never heard of circuit level filtering applying at the session 
layer.   My understanding is that circuit level filters work at the network 
layers 3/4 of the OSI model.   The session layer is layer 5.

> > Gateway simply refers to a machine which is in the path between your
> > network and the outside world - can mean anything from a simple router
> > with no filtering capabilities to a multi-protocol proxy server with
> > intrusion detection.
>
> Thx but, I meant "Circuit Level gateway" not a simple gateway I mean
> IP(or network level).

Sure, but what I meant was that "gateway" just means a machine in the middle 
of a communications path.   It could be a circuit level gateway, it could be 
an application layer gateway, it could be a network layer gateway.

> > Netfilter (iptables) is a stateful packet filter, and therefore operates
> > at layers 3/4 of the OSI model - the network layers.   It does not
> > meaningfully operate at layer 7 - the application layer.
>
> But I think matching RELATED state of ftp data connection means working
> on layer 7.

You are correct - netfilter has some very limited and very specific 
understandings of what happens at layer 7.   This does not make it an 
application layer filtering system.

> > If you want realistic application layer filtering on a linux system you
> > need proxy applications like sendmail/exim/apache/squid/frox.   Netfilter
> > won't do it for you.
>
> So you mean there's no such matching module or action in Netfilter.

About the closest you can get with netfilter is the "string" match, but that 
is not very useful if you compare it what can be done with a proper proxy.

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


