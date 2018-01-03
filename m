From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHED
Date: Wed, 3 Jan 2018 10:15:28 -0500
Message-ID: <CAMOPTExc4Gin=91HTw_fAuoqokX_kPx8ZMf-jDWy0KJu=f-54g@mail.gmail.com>
References: <CAMOPTEw27JqkKn1b5Y7-i79SRWn3pX+RNNEh3kvpLQBXzOR27A@mail.gmail.com>
 <28c711a6f49a42059d3cf6b47b486f8d@CCDEX023.corp.corpcommon.com>
 <20180102183645.77a59ecc@playground> <cbb2077300a541f396aeb02edc4317d3@CCDEX023.corp.corpcommon.com>
 <CAMOPTExzcsPh0r1V2juiQZJdSgjWfZZqbw8partoCvy_gkURqQ@mail.gmail.com> <CACuyg249H4Xd_mbxzkSFpBO7+XtPM1tSMf80UuzU98dAEQvpBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cwiR9uQ9dNhYOnKhwdRTMr2k55dnar0u6sprs1/HTqc=;
        b=Oo06JRciV2hznZP7V1K+0LPwH3QO5u7qSgBwaIqOoikiaxsFUkU2U4BqfvAp/r51Aq
         8CdThID9eG1HnxjYNkONr6IXSIr5p8nu5Af9hIH9qYPDnwzEPn6pXFD0dsl5Bg8B7H4J
         4Ag3nFBZMvW4ebIbkl19lBM+eaaZVfxDxC4L9np3vZRAd9cBunxUN2kTAKcjMULKeMCH
         xdyGLphj0kyWAOLiARpIl3DnQgesawd7hQxIWjmNvMuURlnLJCwUdPAVs5TqsVlstDWX
         WiS0On3HbYd6o5KaqTrMoNgOu1Ado7fFKEEVKmMp/PFU1SAYtNR+S0u/YQQ6kRyIdYAu
         q3qQ==
In-Reply-To: <CACuyg249H4Xd_mbxzkSFpBO7+XtPM1tSMf80UuzU98dAEQvpBQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Paulsberg=2DCsibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks, Humberto. That certainly allows me to see what policy and rule
is being applied. Thanks!

If anyone is aware of a book or blog or something that explains the
state stuff discussed above without ANY ambiguity at all, I'd love to
read it!

Oliver

On Wed, Jan 3, 2018 at 9:34 AM, Humberto Juc=C3=A1 <betolj@gmail.com> wrote=
:
> Hi,
>
> Try something like this:
> iptables -t raw -I PREROUTING -p icmp -j TRACE
>
> After this, use the "tail -f" command in your syslog or messages file:
> tail -f /va
>
> 2018-01-03 11:01 GMT-03:00 Oliver O'Boyle <oliver.oboyle@gmail.com>:
>> All,
>>
>> Thanks for the replies, your help is much appreciated.
>>
>> Andre, the link you included in your last message is one of the ones
>> I've been referencing and it'sm in the fact, the one that's causing
>> the confusion.
>>
>> a) I agree that ICMP is a connectionless protocol and we would not
>> normally expect to see an established two-way session with it, such as
>> we would see with TCP.
>> b) As per Neal's and Pascal's comments above, I agree that
>> Netfilter/Conntrack impose a connected (or unconnected) state between
>> two endpoints/streams which is what's seen in the output of 'sudo
>> contrack -E'.
>>
>> But I'm still not getting the result I'm hoping to see. Maybe it's
>> just not possible, though. I'll re-phrase what I'm looking for to see
>> if there's a different avenue for answers:
>>
>> Referencing the following quote from the link Andre sent: 'When the
>> firewall sees a request packet, it considers it as NEW. When the host
>> sends a reply packet to the request it is considered ESTABLISHED.'
>>
>> I'd like to see which packets are considered 'ESTABLISHED'. Or, I'd
>> like a clear confirmation that the connection stream these ESTABLISHED
>> packets are part of is considered "approved/allowed" to pass. I don't
>> care which tool I use to see these. If the approval I'm looking for is
>> in the form of a missing statement (meaning that the
>> packet/stream/connection is considered allowed/established because
>> there is no statement that explicitly declares a
>> packet/stream/connection as NOT allowed/established) then I can work
>> with that too, I just need confirmation that this is the case.
>>
>> Thanks!
>> Oliver
>>
>>
>>
>> On Wed, Jan 3, 2018 at 5:13 AM, Andr=C3=A9 Paulsberg-Csibi (IBM Consulta=
nt)
>> <Andre.Paulsberg-Csibi@evry.com> wrote:
>>> I think here are some semantics confused ( could be my fault ).
>>>
>>> My statement is meant to explain that the term "ESTABLISHED" used in CO=
NNTRACK , does not match the state "ESTABLISHED" used in iptables rules-set=
 .
>>> ESTABLISHED in iptables ruleset simply means there is an entry directly=
 related to the packet that is being examined in the connection table .
>>>
>>> ESTABLISHED in the conntrack TERM is only used for TCP as here the pack=
ets have multiple timers as at least TCP is session/connection based protoc=
ol ,
>>> I am not aware of other protocols who have other times and multiple set=
s of session/connection states in netfilter/iptables/conntrack and using th=
is TERM in same manner .
>>>
>>> RELATED is actually not the FIRST/NEW packet of new connection , it is =
any packet ( first second or later ) from any system that could be indirect=
ly connected to any one connection table entry .
>>> Including ICMP messages like type 11 ( TTL exceeded ) typically sent fr=
om every router on the way until you reached the end target destination whe=
n doing a traceroute .
>>>
>>> When conntrack deals with other none TCP it uses only UNREPLIED / ASSUR=
ED and not the term ESTABLISHED
>>> And for ICMP it does not use ASSURED , only UNREPLIED ( which is remove=
d after the first reply )
>>>
>>> As far as I can tell there are 6 states for the connection table part (=
 7 if you include those NOT/NEVER there )
>>> NEW
>>> ESTABLISHED
>>> RELATED
>>> INVALID
>>> UNTRACKED
>>> CLOSED
>>>
>>> For me these semantics is also not so self explanatory , specially sinc=
e the terms somewhat overlap and are missing for others .
>>> ( but now maybe this is a bit more clear ) If not here is more details =
http://www.iptables.info/en/connection-state.html
>>>
>>>
>>> Best regards
>>> Andr=C3=A9 Paulsberg-Csibi
>>> Senior Network Engineer
>>> IBM Services AS
>>>
>>> -----Original Message-----
>>> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kern=
el.org] On Behalf Of Neal P. Murphy
>>> Sent: Wednesday, January 3, 2018 12:37 AM
>>> Cc: netfilter@vger.kernel.org
>>> Subject: Re: conntrack and ICMP echo replies not showing as ESTABLISHED
>>>
>>> On Tue, 2 Jan 2018 21:56:07 +0000
>>> Andr=C3=A9 Paulsberg-Csibi (IBM Consultant)         <Andre.Paulsberg-Cs=
ibi@evry.com> wrote:
>>>
>>>> As far as I can tell - ESTABLISHED - is only for session based protoco=
ls like TCP .
>>>> You will not see that for UDP or ICMP , as far as CONNTRACK is concern=
ed .
>>>
>>> With netfilter, there are five connection states: NEW, RELATED, ESTABLI=
SHED, INVALID and RAW.
>>>   - A NEW packet is the first packet of a new peer-to-peer communicatio=
n connection
>>>     (a conn), be it TCP, SCTP, UDP, GRE, or any other protocol.
>>>   - A RELATED packet is the first packet of a new conn that netfilter d=
etermined is
>>>     related to an existing conn (the data conn of an FTP conn, for exam=
ple).
>>>   - When two-way communication is established with a reply packet, the =
conn's state
>>>     changes to ESTABLISHED.
>>>   - INVALID packets are those that netfilter has received but has no id=
ea what to do
>>>     with them; they are packets that can only belong to an ESTABLISHED =
conn but it can
>>>     find no such conn in its database.
>>>   - I think RAW packets are those that netfilter has been told not to p=
rocess; but I'm
>>>     not sure of this as I've never had reason to use RAW packets.
>>>
>>> In netfilter, 'connection' is not related to connection-oriented protoc=
ols. It has to do with the relationship--the logical connection--between tw=
o endpoints on a LAN or on some internetwork of them. It is much like two p=
eople talking on a walkie-talkie, two people exchanging TXT MSGs, or two pe=
ople talking on a phone that has a circuit-switched connection set up betwe=
en them.
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in=
 the body of a message to majordomo@vger.kernel.org More majordomo info at =
 https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fvger.k=
ernel.org%2Fmajordomo-info.html&data=3D02%7C01%7C%7C8cd63c84f69240d4239308d=
5523e4c6d%7C40cc2915e2834a2794716bdd7ca4c6e1%7C1%7C0%7C636505349884829535&s=
data=3Dhwc8E8kipzNl9HDW3SWhZfc9w2WgFoOXHH43uV5ugNk%3D&reserved=3D0
>>
>>
>>
>> --
>> :o@>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
:o@>
