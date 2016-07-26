From: namus <suman.subj@gmail.com>
Subject: Re: Fwd: Need guidance in - dropping incoming packets to a interface
 in a bridged network.
Date: Tue, 26 Jul 2016 11:13:19 +0300
Message-ID: <CAGx1xT1M=ymRVsLB_aFGuFfwZeH916y9eRzTsRTCFdv53XTygQ@mail.gmail.com>
References: <CAGx1xT3HGq8WNmHAmEAOUR551LuBrDoFo=uhW6VV1w50KpBb4A@mail.gmail.com>
 <CAGx1xT1+z8=0k9bc-iHKJZkjP0Lbe2rdU-V2wFMaus2tXzpT1Q@mail.gmail.com>
 <CAGx1xT3r9xXVU1uZYWJL3P68NMvOutKnR5FW8JDhFHnRYq4u7A@mail.gmail.com> <a529b978-43b6-118e-0772-174c1a47f956@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A857VSPFkrY6LgpC9Pg5/cxh7LeI+CJbs7ViiYcvD4Q=;
        b=wWmqngAgejXDS34WXSIxSvhLv381rJDNtKbOsyl1w0Pgn02LsvBtvgV5W1SHw9il6J
         J62WD0R0SZl69L+uOyOv7ukOlEfM2JWh+usGbZxV9hFRyko1tI24CVTJsW6aukgpAXjg
         WoNJY9ItfcFAnCGhRCSbNW2KDbmPUio4kmpmWCzm5J7/lXV0/BUtggwFD3/Jj59kRZas
         Nq7y6vfPKf8HmnB8XFw9a0Xdd31t2AnepgViNZnoHopNEIWihwjblQCFMQuxg00t7MWr
         a4KcHFcGfRANZ33wbjqfAj18MoXh+AxEwOjKG3MqQ1+IUUWJ5NxCE1KBPKmUIueo3WIi
         U76Q==
In-Reply-To: <a529b978-43b6-118e-0772-174c1a47f956@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

Your suggestion has worked ..

$iptables -t filter  -I FORWARD  -m physdev --physdev-in eth2  -j DROP
(works ie.,  drops the incoming packets )

$iptables -t filter  -D FORWARD  -m physdev --physdev-in eth2  -j DROP
(undo / del the previous rule .. allows incoming  packets)

Could you please guide me .. How to send the (DROP) message via
setting the socket options (programmatically) ..
ie., in filling-up the ipt_replace/xt_entry_match/xt_entry_target
structure data structure / could you please point me to any simple
example of "physdev" match case .


Thanks a lot ,
Suman.

On Mon, Jul 25, 2016 at 9:07 PM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> Le 25/07/2016 =C3=A0 12:37, namus a =C3=A9crit :
>>
>> Hi Team,
>>
>> My device contains 2 ethernet interfaces(eth1 and eth2)  added to
>> bridge interface(br0)
>> I am trying to DROP all the packets to eth1 interface based on some
>> user-condition .
>
> (...)
>>
>> Following commands do not work:
>>
>> iptables -t filter -I INPUT -i eth2 -j DROP (doesn't drop any packet=
s
>> - checked via tcpdump of eth2 )
>
>
> Check the "physdev" match.
>
