From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sat, 21 Sep 2002 23:01:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921220139.PMFA27185.mta03-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <20020921135239.CIIH27185.mta03-svc.ntlworld.com@there> <0a5401c261b9$ae9e01f0$c6b22543@repligate>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0a5401c261b9$ae9e01f0$c6b22543@repligate>
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

On Saturday 21 September 2002 10:56 pm, Jim Fleming wrote:

> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
>
> > I think that is an extreme ( = unreasonable ) point of view.
> >
> > Of the 160 bits in an IPv4 header, I really do not see how you could
> > reasonably use these 49 for routing purposes:
> >
> > 16 bits - fragment identifier
>
>       DARPA INTERNET PROGRAM
>       PROTOCOL SPECIFICATION
>       September 1981
>       Identification
>
>                 "The choice of the Identifier for a datagram is based on
> the need to provide a way to uniquely identify the fragments of a
> particular datagram.  The protocol module assembling fragments judges
> fragments to belong to the same datagram if they have the same source,
> destination, protocol, and Identifier.  Thus, the sender must choose the
> Identifier to be unique for this source, destination pair and protocol for
> the time the datagram (or any fragment of it) could be alive in the
> internet.
>                 It seems then that a sending protocol module needs to keep
> a table of Identifiers, one entry for each destination it has communicated
> with in the last maximum packet lifetime for the internet. However, since
> the Identifier field allows 65,536 different values, some host may be able
> to simply use unique identifiers independent of destination.
>                 It is appropriate for some higher level protocols to choose
> the identifier. For example, TCP protocol modules may retransmit an
> identical TCP segment, and the probability for correct reception would be
> enhanced if the retransmission carried the same identifier as the original
> transmission since fragments of either datagram could be used to construct
> a correct TCP segment."

Sorry for the lengthy quote of the previous posting, but I really don't see 
what you're trying to say here.   The above is a good description of the 
fragment identifier field in the IPv4 header, however it doesn't mention 
routing at all, which is what I thought we were discussing ?

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

