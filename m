From: Saatvik Agarwal <saatvik.agarwal@stanford.edu>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Wed, 27 May 2009 22:06:08 -0700
Message-ID: <4ddb24250905272206n223486b8r3a77d46e1a3a1a35@mail.gmail.com>
References: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com>
	 <b65cae940905271901k5959bdeby9c9159f5e8af2a02@mail.gmail.com>
Reply-To: saatvik.agarwal@stanford.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:reply-to:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=XNLGyV4a3nkfTlczhBIe9vtnqih//75NuICEzoCOGvQ=;
        b=TeXW6VQ2ncXk5Brj+0gNGdX+XVg/s8znp/7vgouX46xdHZtzfcmajXK4q8xRQylXe+
         jg30BK+TSUvE2RzhSTEdY/D0CEgI7ylpqmMGjLYvejIqF0mjhnN93WLSXS369cc8C0k5
         L5EzsuyJGaD4HXgitS3VINCL2vQX07q7sac2w=
In-Reply-To: <b65cae940905271901k5959bdeby9c9159f5e8af2a02@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

Just tried SNAT - I see the same behavior unfortunately. Any other
suggestions/comments?

Thanks,
Saatvik


On 5/27/09, George B. <georgeb@gmail.com> wrote:
> Masquerade won't support incoming connections.=A0=A0An inbound syn wi=
ll
>  always be rejected unless it is associated with the outbound
>  connection.=A0=A0Try SNAT instead of MASQUERADE and be sure to allow
>  inbound traffic.
>
>
>
>  On Wed, May 27, 2009 at 3:06 PM, Saatvik Agarwal
>  <saatvik.agarwal@stanford.edu> wrote:
>  > Hello all,
>  >
>  > For my research project in school, I am trying to establish TCP
>  > connections when both hosts are behind full-cone NATs using TCP's
>  > simultaneous open functionality. Unfortunately, it seems that ipta=
bles
>  > does not support TCP simultaneous open. For my test environment, I
>  > simulate a full-cone NAT using iptables. My iptables rule is exact=
ly
>  > as follows:
>  >
>  > iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>  >
>  > Of course, here my eth0 is the interface connected to the internet=
=2E
>  > Everything else is set to accept; there is no filtering or anythin=
g.
>  > In fact, I run iptables --flush before adding the above rule.
>  >
>  > Using wireshark, the behavior I observe on both the iptables NAT b=
oxes
>  > is that both of them send out/see a SYN coming from their NATted h=
ost
>  > before they receive a SYN from the other host. Unfortunately, both
>  > NATs respond with TCP RSTs to this incoming SYN (note that the
>  > incoming SYN corresponds to the exact same connection, i.e. port,
>  > endpoint tuple, as the outgoing SYN). The idea behind simultaneous
>  > open is that there are two SYNs in-flight at the same time and the=
y
>  > cross in the network. According to the TCP spec, this should resul=
t in
>  > two TCP SYN-ACKs - one from either host - resulting in a four-way
>  > handshake as opposed to the usual three-way handshake. Instead of
>  > responding with RSTs, both NATs should let the incoming SYNs go
>  > through if they were to support simultaneous open (and because the
>  > port mapping should already have been created by the outgoing SYN)=
=2E
>  >
>  > I have well-tested code running on the client machines behind the =
NATs
>  > that try to do a simultaneous open. To do so, I basically call con=
nect
>  > in a tight loop on both the connecting machines. There is a rendez=
vous
>  > server which tells both NATted hosts their corresponding public
>  > endpoints (IP address, port) so that they can connect.
>  >
>  > According to the BEHAVE requirements outlined in IETF RFC 5382, TC=
P
>  > simultaneous open must be supported by "well behaved NATs". So is
>  > there a mistake in my rules or does iptables not support simultane=
ous
>  > open?
>  >
>  > Apologies for the long description, particularly if you are famili=
ar
>  > with simultaneous open. I couldn't find any discussion regarding t=
his
>  > on the list. Please let me know if something is not clear.
>  >
>  > Thank you,
>  > Saatvik Agarwal
>
> > --
>  > To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>  > the body of a message to majordomo@vger.kernel.org
>  > More majordomo info at=A0=A0http://vger.kernel.org/majordomo-info.=
html
>  >
>
