From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHED
Date: Wed, 3 Jan 2018 09:01:46 -0500
Message-ID: <CAMOPTExzcsPh0r1V2juiQZJdSgjWfZZqbw8partoCvy_gkURqQ@mail.gmail.com>
References: <CAMOPTEw27JqkKn1b5Y7-i79SRWn3pX+RNNEh3kvpLQBXzOR27A@mail.gmail.com>
 <28c711a6f49a42059d3cf6b47b486f8d@CCDEX023.corp.corpcommon.com>
 <20180102183645.77a59ecc@playground> <cbb2077300a541f396aeb02edc4317d3@CCDEX023.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Nw1TxWLH484iqJEMFgxUG6Aksm89jRHDpbuU61L3kgw=;
        b=TWTB1jZlfOJTZ4RZFFgyI/1p6x6hV6yXG1UIpNKgwWkDziuLdisTCjo0OGY37Kz5k8
         q9E9b3kklMoPfbNnQnmD/kGIonBH7yaamPyB84lyuUXJMjoTgO6lANKDvpFu/forhpFv
         DpgjP2QUqNZ37oZk9EDozZVi+rq4NMM7KMmo3A5wd6575q5kK1vb9kaisQjBO4lLp/uz
         JrgT2Grz8Xx/D/h3nZz7/PgkfWp+TyH0CqGuANn45aabAQNbqcskG3YFZp3cKtXUANco
         ivD+TzBj2tfMWV0lYT4gOb/SpPesebJdelRCsvQVw8/J5AWoWOSotacwBOsBbt1Diyz1
         pjMg==
In-Reply-To: <cbb2077300a541f396aeb02edc4317d3@CCDEX023.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Andr=C3=A9_Paulsberg=2DCsibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>
Cc: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

All,

Thanks for the replies, your help is much appreciated.

Andre, the link you included in your last message is one of the ones
I've been referencing and it'sm in the fact, the one that's causing
the confusion.

a) I agree that ICMP is a connectionless protocol and we would not
normally expect to see an established two-way session with it, such as
we would see with TCP.
b) As per Neal's and Pascal's comments above, I agree that
Netfilter/Conntrack impose a connected (or unconnected) state between
two endpoints/streams which is what's seen in the output of 'sudo
contrack -E'.

But I'm still not getting the result I'm hoping to see. Maybe it's
just not possible, though. I'll re-phrase what I'm looking for to see
if there's a different avenue for answers:

Referencing the following quote from the link Andre sent: 'When the
firewall sees a request packet, it considers it as NEW. When the host
sends a reply packet to the request it is considered ESTABLISHED.'

I'd like to see which packets are considered 'ESTABLISHED'. Or, I'd
like a clear confirmation that the connection stream these ESTABLISHED
packets are part of is considered "approved/allowed" to pass. I don't
care which tool I use to see these. If the approval I'm looking for is
in the form of a missing statement (meaning that the
packet/stream/connection is considered allowed/established because
there is no statement that explicitly declares a
packet/stream/connection as NOT allowed/established) then I can work
with that too, I just need confirmation that this is the case.

Thanks!
Oliver



On Wed, Jan 3, 2018 at 5:13 AM, Andr=C3=A9 Paulsberg-Csibi (IBM Consultant)
<Andre.Paulsberg-Csibi@evry.com> wrote:
> I think here are some semantics confused ( could be my fault ).
>
> My statement is meant to explain that the term "ESTABLISHED" used in CONN=
TRACK , does not match the state "ESTABLISHED" used in iptables rules-set .
> ESTABLISHED in iptables ruleset simply means there is an entry directly r=
elated to the packet that is being examined in the connection table .
>
> ESTABLISHED in the conntrack TERM is only used for TCP as here the packet=
s have multiple timers as at least TCP is session/connection based protocol=
 ,
> I am not aware of other protocols who have other times and multiple sets =
of session/connection states in netfilter/iptables/conntrack and using this=
 TERM in same manner .
>
> RELATED is actually not the FIRST/NEW packet of new connection , it is an=
y packet ( first second or later ) from any system that could be indirectly=
 connected to any one connection table entry .
> Including ICMP messages like type 11 ( TTL exceeded ) typically sent from=
 every router on the way until you reached the end target destination when =
doing a traceroute .
>
> When conntrack deals with other none TCP it uses only UNREPLIED / ASSURED=
 and not the term ESTABLISHED
> And for ICMP it does not use ASSURED , only UNREPLIED ( which is removed =
after the first reply )
>
> As far as I can tell there are 6 states for the connection table part ( 7=
 if you include those NOT/NEVER there )
> NEW
> ESTABLISHED
> RELATED
> INVALID
> UNTRACKED
> CLOSED
>
> For me these semantics is also not so self explanatory , specially since =
the terms somewhat overlap and are missing for others .
> ( but now maybe this is a bit more clear ) If not here is more details ht=
tp://www.iptables.info/en/connection-state.html
>
>
> Best regards
> Andr=C3=A9 Paulsberg-Csibi
> Senior Network Engineer
> IBM Services AS
>
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel=
.org] On Behalf Of Neal P. Murphy
> Sent: Wednesday, January 3, 2018 12:37 AM
> Cc: netfilter@vger.kernel.org
> Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHED
>
> On Tue, 2 Jan 2018 21:56:07 +0000
> Andr=C3=A9 Paulsberg-Csibi (IBM Consultant)         <Andre.Paulsberg-Csib=
i@evry.com> wrote:
>
>> As far as I can tell - ESTABLISHED - is only for session based protocols=
 like TCP .
>> You will not see that for UDP or ICMP , as far as CONNTRACK is concerned=
 .
>
> With netfilter, there are five connection states: NEW, RELATED, ESTABLISH=
ED, INVALID and RAW.
>   - A NEW packet is the first packet of a new peer-to-peer communication =
connection
>     (a conn), be it TCP, SCTP, UDP, GRE, or any other protocol.
>   - A RELATED packet is the first packet of a new conn that netfilter det=
ermined is
>     related to an existing conn (the data conn of an FTP conn, for exampl=
e).
>   - When two-way communication is established with a reply packet, the co=
nn's state
>     changes to ESTABLISHED.
>   - INVALID packets are those that netfilter has received but has no idea=
 what to do
>     with them; they are packets that can only belong to an ESTABLISHED co=
nn but it can
>     find no such conn in its database.
>   - I think RAW packets are those that netfilter has been told not to pro=
cess; but I'm
>     not sure of this as I've never had reason to use RAW packets.
>
> In netfilter, 'connection' is not related to connection-oriented protocol=
s. It has to do with the relationship--the logical connection--between two =
endpoints on a LAN or on some internetwork of them. It is much like two peo=
ple talking on a walkie-talkie, two people exchanging TXT MSGs, or two peop=
le talking on a phone that has a circuit-switched connection set up between=
 them.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in t=
he body of a message to majordomo@vger.kernel.org More majordomo info at  h=
ttps://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fvger.ker=
nel.org%2Fmajordomo-info.html&data=3D02%7C01%7C%7C8cd63c84f69240d4239308d55=
23e4c6d%7C40cc2915e2834a2794716bdd7ca4c6e1%7C1%7C0%7C636505349884829535&sda=
ta=3Dhwc8E8kipzNl9HDW3SWhZfc9w2WgFoOXHH43uV5ugNk%3D&reserved=3D0



--=20
:o@>
