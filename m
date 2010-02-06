From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Who can give me any existing iptables rules for reference?
Date: Sat, 6 Feb 2010 13:19:07 +0000
Message-ID: <56378e321002060519x58825fbby3ff396d5954422f8@mail.gmail.com>
References: <28efc0211002060450n782f9273i9489e289dbc62407@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=gBtF9+IK2LzermB4QBXn6lLYnUHM0bKnvUHta//Toj0=;
        b=sLix9HFQ9kEsxQsnM060zDflLIkW+7cHTU45bQS6MHW7rhuzZQQU0goaDeujPVQ4tj
         KAw4XLI+oqGqbci9iNhhT+74ZqvHUsb1BkXKxtJmd4xY1UVIGU5g6heovhPj6WtatKrh
         J2J6mOFp3Yrc4TABM1M6H6n3lmm0ipgOeYWRA=
In-Reply-To: <28efc0211002060450n782f9273i9489e289dbc62407@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: supercodeing35271 supercodeing35271 <supercodeing35271@gmail.com>
Cc: netfilter@vger.kernel.org

On 6 February 2010 12:50, supercodeing35271 supercodeing35271
<supercodeing35271@gmail.com> wrote:
> Hi,i'm a rookie.As learning netfilter/iptables for the first time,i
> wanna look some good existing iptables rules scripts as that i think
> reading good rules scripts will be useful.
> So anyone here can share some rules or tell me where to see any good
> rules scripts. =A0I must underline that i just need some references,i=
 do
> not have any other reason about this.
> Thank every one.

What kind of rule sets are you looking for?

Rules to protect a public facing server are going to be different (to
varying degrees depending on services etc) to those for a home PC, to
those for a router/gateway.

One of the best ways to learn would be change the policies to block
then work out how to allow the traffic you want to flow around while
not opening up what you don't want...

=46or instance...

iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

Lines 1 to 3 changes the policy to DROP  (You can only use DROP or
ACCEPT as policies) and lines 4 and 5 enable the loopback interface.

(Drop =3D=3D silently discard packets without notifying the originator,
Accept =3D=3D allow packet through firewall, Reject =3D=3D Returns an I=
CMP
message to the orgination, you can vary the return message).


--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
