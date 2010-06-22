From: Ninad Adi <adi.ninad@gmail.com>
Subject: Re: QUES : connection tracking
Date: Tue, 22 Jun 2010 14:32:37 +0530
Message-ID: <AANLkTimRqfY21Aymecae8ffB05PaDZ_aCuQsctdlHoTb@mail.gmail.com>
References: <AANLkTinyiIqkyccSaDciSCbrbOYNPbS8sqA4Mj_VsTHq@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=aJ4/Ua21OnxRfzH+3FStql9aFfWgjFHjyTQbDrqz4so=;
        b=w5HrPsPeFOBq2AADF5Cqg/RYr2z5OCiJbWsCbwMOXWdmo7qRN3QeAV+tadIb0x5vrs
         DezcpeAqP5GvXfNeusJ97vgcKor/nz7pNUwExXPAvvhadnpr4Fhcx+cqEEnxpjKCRuVS
         BJbhT2/BzdFmilOjHXrcddmZ8QEeWh1HO+q08=
In-Reply-To: <AANLkTinyiIqkyccSaDciSCbrbOYNPbS8sqA4Mj_VsTHq@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

To, Netfilter Giants and Professionals,

I am a netfilter newbie, trying to analyse the system architecturally.

Sorry for answering the questions myself, Let me know if I am wrong !!!=
!!

QUES:  What code is present architecturally in net/ipv4/netfilter
           directory and what code is present architecturally in net/ne=
tfilter
           directory ?
           Kernel 2.6.34 --> ubuntu Linux 10.04
           net/ipv4/netfilter --> This code contains connection
trackers, NAT helpers and
                                        kernel part for rule targets.
           net/netfilter --> This code contains conntrack helpers and
main conntrack system and
                                  conntrack subsystem.

QUES: Why do we use terms layer 5 connection trackers and layer 3
           connection trackers whereas connection is maintained only
           at layer 4 ?

           Finally after studying the code I got what I wanted.

           Layer 3 connection trackers are just for ipaddress tuple
entries and are practically
           useless if there is no layer 4 connection tracker with it.
           i.e we can say layer3 conection trackers are entry point
into the conntrack system as
           they are not dependent on incoming and outgoing interfaces.

           Layer 5 connection trackers are nothing but merely helpers
like FTP data port
           connection and which tells whether a particular connection
is related to the
           main connection or not.

           Layer 4 connection trackers functioning shows us the actual
entries in the conntrack
           table/tuple doubly linked list or in proc/net/nf_conntrack e=
ntries.

           Finally the connection is registered at the exit from POST
ROUTING HOOK.


Thanks,
A newbie into the world of firewall security mechanism.


On Mon, Jun 21, 2010 at 1:13 PM, Ninad Adi <adi.ninad@gmail.com> wrote:
> QUES: =A0What code is present architecturally in net/ipv4/netfilter
> =A0 =A0 =A0 =A0 =A0 =A0directory and what code is present architectur=
ally in net/netfilter
> =A0 =A0 =A0 =A0 =A0 =A0directory ?
>
> QUES: Why do we use terms layer 5 connection trackers and layer 3
> =A0 =A0 =A0 =A0 =A0 connection trackers whereas connection is maintai=
ned only
> at layer 4 ?
>
>
>
> Ninad.
>
