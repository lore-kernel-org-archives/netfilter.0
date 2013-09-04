From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: automatic helper assignment is deprecated and it will be removed soon
Date: Wed, 4 Sep 2013 21:29:02 +1000
Message-ID: <CAMD-=V+FC-Cq-zSd3H7j+DvuMrZ6m-xm-qAikPBwW31_VuNCZQ@mail.gmail.com>
References: <CAMD-=V+QAVw23X9eSAuzF4nz0kH0+vw0Om46+ofr0EGMVW6PNA@mail.gmail.com>
	<1377952582.3513.45.camel@ice-age.regit.org>
	<CAMD-=V+yrawW6hPSLxp=0j+4=Gt88uo5sEL4gqoRJ8n3dMWWnw@mail.gmail.com>
	<1378067313.3513.54.camel@ice-age.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=PQnudAM9bpuQX+PdibXaiXO2DctfUN/khm0tqdRufOU=;
        b=gSYZid/EXxK87QOUeZiGQnD33cWPiuEHcltei2TAR5b0dbX1uAZIDzaskY6g2IucKk
         GwwzJUnhLufYF2aIYlKwgGsbhOaTqZLv02Lo5FHSBU+k9OH3MvrMqAnTRyfkyhSxIbmz
         cppBt0dVWLaejfUFj7Cu93qEqDkVPCCjy+T0YFYITLUPGPQT6ziOgVqplO33MZQuQXx9
         CXhPibrr76kDS17y2yUb7Qi9yQeddh/QKZ+3CPvoZccKupb1BfcVhy8dRFF2dvocqJ2L
         miVOWLIsoXha/kmPLKcYjLCbkGb7wmPT621pPHduSC64diGOv9GSz7JH0FXustBAiGrp
         rgOg==
In-Reply-To: <1378067313.3513.54.camel@ice-age.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

thanks for clearing that up, as for IPv6,

iptables -A PREROUTING -t raw -m multiport -p tcp --dports 6667,7777
-j CT --helper irc

/usr/local/sbin/ip6tables -A PREROUTING -t raw -m multiport -p tcp
--dports 6667,7777 -j CT --helper irc
ip6tables: No chain/target/match by that name.

I must have left something out of the kernel build then, that's the
only IPv6 rule that fails



On 9/2/13, Eric Leblond <eric@regit.org> wrote:
> Hello,
>
> Le dimanche 01 septembre 2013 =E0 17:11 +1000, Nick Edwards a =E9crit=
 :
>> Hi Eric,
>>
>> Thank you for that, one thing though on PREROUTING, is that just ext=
ra
>> security, not critical for ftp to work,or not really needed after I
>> fix my forwarding rule up.
>
> FORWARD changes are not needed at a functional level. It is a securit=
y
> improvement.
> Using CT target in PREROUTING (raw) to affect helper to flow will be
> needed once the automatic helper affectation will be disabled by
> default.
>
>> As you can tell I'm far from an expert, but since the CT line wouldn=
t
>> take with IPv6, I am assuming it is not critical to its functioning
>> (bless I hit a IPv6 bug)
>
> CT target is working with IPv6. The same change will needs to be made=
=2E
>
> BR,
>
>
>> Thanks
>>
>>
>>
>>
>>
>>
>> On 8/31/13, Eric Leblond <eric@regit.org> wrote:
>> > Hello,
>> >
>> > Le samedi 31 ao=FBt 2013 =E0 16:09 +1000, Nick Edwards a =E9crit :
>> >> Hi,
>> >>  This message is now appearing on some of our servers..
>> >> google is full of much info, and confusion.
>> >
>> > This is linked with the document that can be found here:
>> >  https://home.regit.org/netfilter-en/secure-use-of-helpers/
>> >
>> > Don't hesitate to command this document if you find some part need=
s
>> > explanation.
>> >
>> > The change in automatic helper assignment is motivated by an attac=
k
>> > found on helper and implemented in the tool named opensvp:
>> >
>> > https://home.regit.org/2012/06/opensvp-a-new-tool-to-analyse-the-s=
ecurity-of-firewalls-using-algs/
>> >
>> >> I understand it to be
>> >> iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j A=
CCEPT
>> >> becomes
>> >> iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
>> >>
>> >> with new rules to add being
>> >> -A FORWARD -m conntrack --ctstate RELATED -m helper --helper ftp =
-p
>> >> tcp --dport 21 -j ACCEPT
>> >
>> > This change you have just described is a security improvement. By =
the
>> > way, it should not work. The last rule you wrote states that packe=
ts
>> > RELATED to a connection, going to port 21 and linked with the FTP
>> > helper
>> > have to be accepted. This is not what you want as port 21 is the
>> > original connection.
>> >
>> > A correct rule will be something like
>> > iptables -A FORWARD -m conntrack --ctstate RELATED -m helper \\
>> >        --helper ftp -p tcp \\
>> >        --dport 1024: -j ACCEPT
>> >
>> > You accept all packets RELATED to an ftp connection on port > 1024=
=2E If
>> > you know where the FTP connection took place, you can add more fil=
ter
>> > to
>> > discriminate the flow.
>> >
>> >> then some sites talk about
>> >>  -A PREROUTING -t raw -p tcp --dport 21 -j CT --helper ftp
>> >
>> > Here, you say: traffic to port 21 IS FTP. This will mimic the curr=
ent
>> > behavior of helper (automatic assignement) and this only rule (wit=
hout
>> > the previously mentioned change) will allow you to support the fut=
ure
>> > change to non automatic assignment (assuming you only need the ftp
>> > helper on your system).
>> >
>> >>
>> >> So, does removal of ESTABLISHED on original rules, now mean we ne=
ed
>> >> one of, of both of, these new rules?
>> >>
>> >> I tried on our IRC server, but it balked with ip6tables  at xt_CT=
: No
>> >> such helper "irc"
>> >> same command with iptables seemed to take..
>> >>
>> >> What is the correct way to replace this ESTABLISED since nf_connt=
rack
>> >> will soon be removed
>> >
>> > No removal of nf_conntrack is planned. The only change planned is =
the
>> > removal of automatic assignement ie 21->ftp helper is used.
>> >
>> >>
>> >> Are they even needed anymore?  (I think irc helper is only needed=
 for
>> >> dcc
>> >> etc)
>> >>  is FTP still  needed for ftp?
>> >
>> > As mentioned before NO change on helper logic. They are still need=
ed to
>> > handle protocol with dynamic connection opening.
>> >
>> > BR,
>> > --
>> > Eric
>> >
>
>
