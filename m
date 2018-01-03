From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHED
Date: Wed, 3 Jan 2018 12:51:36 -0500
Message-ID: <CAMOPTEy4HXMXWRh8DDjAjwUGixULofXdqF4MFx1yTNM9ynOu_w@mail.gmail.com>
References: <CAMOPTEw27JqkKn1b5Y7-i79SRWn3pX+RNNEh3kvpLQBXzOR27A@mail.gmail.com>
 <28c711a6f49a42059d3cf6b47b486f8d@CCDEX023.corp.corpcommon.com>
 <20180102183645.77a59ecc@playground> <cbb2077300a541f396aeb02edc4317d3@CCDEX023.corp.corpcommon.com>
 <CAMOPTExzcsPh0r1V2juiQZJdSgjWfZZqbw8partoCvy_gkURqQ@mail.gmail.com>
 <CACuyg249H4Xd_mbxzkSFpBO7+XtPM1tSMf80UuzU98dAEQvpBQ@mail.gmail.com> <CAMOPTExc4Gin=91HTw_fAuoqokX_kPx8ZMf-jDWy0KJu=f-54g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yV99NMxYLwW1IFM6v4yD/4FID1mRZkO7s0fpfJQkSyk=;
        b=nXLKajyvpjMJL7RAuzMDsgUp8Vigvz7YLBFNYL8oSUylF8tes+Rh5n93me31GOBFQ8
         +nDTVd9ol09D1Beky7yFlT6JZ3anAH2OmxZQZ+EpwYd7T4H7StRH8rYLxZ/P9sQe0F6R
         pfyEwouiHh4Rd+xE4SX3E9SFTLWthNlA/elnl9GkMR7Hs3tbOK+gyeFYTa4+Gl1TfZi2
         ygeIKyVWbuphjo0LaOuP2+eAt2jv2ezx6jOVO/rsnko3U6wTRZ4VnAMmRmtS+1uL+B6f
         0SpZuJeEFJzOTMqhBCIomHjGL8NufMZh4Zore1GDmiNAK/H0H3JfMBDM3HEVF7ITFug5
         vHvw==
In-Reply-To: <CAMOPTExc4Gin=91HTw_fAuoqokX_kPx8ZMf-jDWy0KJu=f-54g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Paulsberg=2DCsibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This article helped clear up some questions/misconceptions I was having:

https://i-admin.blogspot.ca/2014/02/caveats-about-linux-connection-tracking=
.html

I now better understand that connection tracking is enabled by default
and that the matches for NEW and ESTABLISHED etc... use the connection
tracking information already being collected and updated in the
PREROUTING and OUTPUT chains.

The level of detail visible in the sudo conntrack -L and -E commands
make sense now and are directly related to the layer 4 protocols in
use (TCP/UDP/ICMP etc...), hence only TCP sessions will show as
established sessions because it's the only connection-oriented
protocol of the three listed.

In a nutshell, "state" is determined via the data collected by and
rules determined by connection tracking. Connection tracking is mostly
just a set of timeouts, thresholds, and verifications that help us
determine if a packet is "likely" or, ideally "mostly guaranteed" to
be part of a known/expected/established layer 4 session. These
timeouts, thresholds, and verifications can be seen by catting the
various files in /proc/sys/net/netfilter (on Ubuntu 16.04LTS). The
conntrack module applies logic to these values which is what
determines the state of a layer 4 session based on the relationship of
packets to one-another, along with the data contained in their fields
and to source and destination endpoints.

Using --ctstate matches in rules simply allows us to tap into the
connection tracking data to make rules more specific and therefore
more secure.

Thanks for the help guys, much appreciated.

Oliver

On Wed, Jan 3, 2018 at 10:15 AM, Oliver O'Boyle <oliver.oboyle@gmail.com> w=
rote:
> Thanks, Humberto. That certainly allows me to see what policy and rule
> is being applied. Thanks!
>
> If anyone is aware of a book or blog or something that explains the
> state stuff discussed above without ANY ambiguity at all, I'd love to
> read it!
>
> Oliver
>
> On Wed, Jan 3, 2018 at 9:34 AM, Humberto Juc=C3=A1 <betolj@gmail.com> wro=
te:
>> Hi,
>>
>> Try something like this:
>> iptables -t raw -I PREROUTING -p icmp -j TRACE
>>
>> After this, use the "tail -f" command in your syslog or messages file:
>> tail -f /va
>>
>> 2018-01-03 11:01 GMT-03:00 Oliver O'Boyle <oliver.oboyle@gmail.com>:
>>> All,
>>>
>>> Thanks for the replies, your help is much appreciated.
>>>
>>> Andre, the link you included in your last message is one of the ones
>>> I've been referencing and it'sm in the fact, the one that's causing
>>> the confusion.
>>>
>>> a) I agree that ICMP is a connectionless protocol and we would not
>>> normally expect to see an established two-way session with it, such as
>>> we would see with TCP.
>>> b) As per Neal's and Pascal's comments above, I agree that
>>> Netfilter/Conntrack impose a connected (or unconnected) state between
>>> two endpoints/streams which is what's seen in the output of 'sudo
>>> contrack -E'.
>>>
>>> But I'm still not getting the result I'm hoping to see. Maybe it's
>>> just not possible, though. I'll re-phrase what I'm looking for to see
>>> if there's a different avenue for answers:
>>>
>>> Referencing the following quote from the link Andre sent: 'When the
>>> firewall sees a request packet, it considers it as NEW. When the host
>>> sends a reply packet to the request it is considered ESTABLISHED.'
>>>
>>> I'd like to see which packets are considered 'ESTABLISHED'. Or, I'd
>>> like a clear confirmation that the connection stream these ESTABLISHED
>>> packets are part of is considered "approved/allowed" to pass. I don't
>>> care which tool I use to see these. If the approval I'm looking for is
>>> in the form of a missing statement (meaning that the
>>> packet/stream/connection is considered allowed/established because
>>> there is no statement that explicitly declares a
>>> packet/stream/connection as NOT allowed/established) then I can work
>>> with that too, I just need confirmation that this is the case.
>>>
>>> Thanks!
>>> Oliver
>>>
>>>
>>>
>>> On Wed, Jan 3, 2018 at 5:13 AM, Andr=C3=A9 Paulsberg-Csibi (IBM Consult=
ant)
>>> <Andre.Paulsberg-Csibi@evry.com> wrote:
>>>> I think here are some semantics confused ( could be my fault ).
>>>>
>>>> My statement is meant to explain that the term "ESTABLISHED" used in C=
ONNTRACK , does not match the state "ESTABLISHED" used in iptables rules-se=
t .
>>>> ESTABLISHED in iptables ruleset simply means there is an entry directl=
y related to the packet that is being examined in the connection table .
>>>>
>>>> ESTABLISHED in the conntrack TERM is only used for TCP as here the pac=
kets have multiple timers as at least TCP is session/connection based proto=
col ,
>>>> I am not aware of other protocols who have other times and multiple se=
ts of session/connection states in netfilter/iptables/conntrack and using t=
his TERM in same manner .
>>>>
>>>> RELATED is actually not the FIRST/NEW packet of new connection , it is=
 any packet ( first second or later ) from any system that could be indirec=
tly connected to any one connection table entry .
>>>> Including ICMP messages like type 11 ( TTL exceeded ) typically sent f=
rom every router on the way until you reached the end target destination wh=
en doing a traceroute .
>>>>
>>>> When conntrack deals with other none TCP it uses only UNREPLIED / ASSU=
RED and not the term ESTABLISHED
>>>> And for ICMP it does not use ASSURED , only UNREPLIED ( which is remov=
ed after the first reply )
>>>>
>>>> As far as I can tell there are 6 states for the connection table part =
( 7 if you include those NOT/NEVER there )
>>>> NEW
>>>> ESTABLISHED
>>>> RELATED
>>>> INVALID
>>>> UNTRACKED
>>>> CLOSED
>>>>
>>>> For me these semantics is also not so self explanatory , specially sin=
ce the terms somewhat overlap and are missing for others .
>>>> ( but now maybe this is a bit more clear ) If not here is more details=
 http://www.iptables.info/en/connection-state.html
>>>>
>>>>
>>>> Best regards
>>>> Andr=C3=A9 Paulsberg-Csibi
>>>> Senior Network Engineer
>>>> IBM Services AS
>>>>
>>>> -----Original Message-----
>>>> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.ker=
nel.org] On Behalf Of Neal P. Murphy
>>>> Sent: Wednesday, January 3, 2018 12:37 AM
>>>> Cc: netfilter@vger.kernel.org
>>>> Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHE=
D
>>>>
>>>> On Tue, 2 Jan 2018 21:56:07 +0000
>>>> Andr=C3=A9 Paulsberg-Csibi (IBM Consultant)         <Andre.Paulsberg-C=
sibi@evry.com> wrote:
>>>>
>>>>> As far as I can tell - ESTABLISHED - is only for session based protoc=
ols like TCP .
>>>>> You will not see that for UDP or ICMP , as far as CONNTRACK is concer=
ned .
>>>>
>>>> With netfilter, there are five connection states: NEW, RELATED, ESTABL=
ISHED, INVALID and RAW.
>>>>   - A NEW packet is the first packet of a new peer-to-peer communicati=
on connection
>>>>     (a conn), be it TCP, SCTP, UDP, GRE, or any other protocol.
>>>>   - A RELATED packet is the first packet of a new conn that netfilter =
determined is
>>>>     related to an existing conn (the data conn of an FTP conn, for exa=
mple).
>>>>   - When two-way communication is established with a reply packet, the=
 conn's state
>>>>     changes to ESTABLISHED.
>>>>   - INVALID packets are those that netfilter has received but has no i=
dea what to do
>>>>     with them; they are packets that can only belong to an ESTABLISHED=
 conn but it can
>>>>     find no such conn in its database.
>>>>   - I think RAW packets are those that netfilter has been told not to =
process; but I'm
>>>>     not sure of this as I've never had reason to use RAW packets.
>>>>
>>>> In netfilter, 'connection' is not related to connection-oriented proto=
cols. It has to do with the relationship--the logical connection--between t=
wo endpoints on a LAN or on some internetwork of them. It is much like two =
people talking on a walkie-talkie, two people exchanging TXT MSGs, or two p=
eople talking on a phone that has a circuit-switched connection set up betw=
een them.
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilter" i=
n the body of a message to majordomo@vger.kernel.org More majordomo info at=
  https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fvger.=
kernel.org%2Fmajordomo-info.html&data=3D02%7C01%7C%7C8cd63c84f69240d4239308=
d5523e4c6d%7C40cc2915e2834a2794716bdd7ca4c6e1%7C1%7C0%7C636505349884829535&=
sdata=3Dhwc8E8kipzNl9HDW3SWhZfc9w2WgFoOXHH43uV5ugNk%3D&reserved=3D0
>>>
>>>
>>>
>>> --
>>> :o@>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> :o@>



--=20
:o@>
