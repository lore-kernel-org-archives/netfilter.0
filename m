From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Tue, 17 Aug 2021 18:05:11 +0300
Message-ID: <CAN_K0LQESjR-g02cebseiNkoxMEf28cgcEt8eJpOJcWsVKpD9w@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vKVZUo7c1YadR3pTI3fXHdPy5SPB1IOg03+JWKXoOQI=;
        b=X8Dj9uH3bDR8NQeDgVBrbJCErCPxnJzesRZw16WqM7dmuq/qGtYtKgcJ5Yi8jJcQSu
         oLPvVAfnPeeLxc3NA6UhoEKFIy2koN27vBnHKi8PnmbIO1MOnBfevpvDs2jXGPdEZl5x
         rDJLU4PcVC3MMEKzup8o69uMhBxp3J2uPanxbYOwUzLOgWmDljBfZIA4GwqM5rds/LmK
         4Tq1WM8IlxFx/IYYrm33KKJ1RlrpZfX4ucNEjGEQMNov/gZRmC1zBi+NUKiVGS6RdxPL
         k/FvhpbUJPG05BqQl4lHIQrSVLToxnBdD2yAeJ84ZRLkpnVsuHmoaXOun0D2y4OdHXld
         uzUA==
In-Reply-To: <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

0
Hi
Did you enable sysctl parameters.

sysctl -w nf_conntrack_acct=3D1
sysctl -w nf_conntrack_timestamp=3D1

On 8/17/21, Bla=C5=BEej Kraj=C5=88=C3=A1k <blazej.krajnak@gmail.com> wrote:
> Hello Pablo,
>
> I'm just rewriting input plugin ulog_inppkt_NFLOG.c to include
> conntrack params. I successfully included CT flags from enum
> ip_conntrack_status (assured, reply seen, ...) and CT state and
> direction from NFULA_CT_INFO.
>
> However, in NFULA_CT few counters from enum nf_conntrack_attr are
> still 0 value. For ex. ATTR_TIMESTAMP_START / STOP and
> ATTR_ORIG/REPL_COUNTER_PACKETS/BYTES.
> Is it normal, or am I missing some bug at parsing?
>
> ne 15. 8. 2021 o 18:23 Bla=C5=BEej Kraj=C5=88=C3=A1k <blazej.krajnak@gmai=
l.com>
> nap=C3=ADsal(a):
>>
>> ne 15. 8. 2021 o 16:31 Pablo Neira Ayuso <pablo@netfilter.org> wrote
>> >
>> > From the example ulogd2 configuration file in the tree:
>> >
>> > http://git.netfilter.org/ulogd2/tree/ulogd.conf.in#n77
>> >
>> > # this is a stack for flow-based logging via XML
>> > #stack=3Dct1:NFCT,xml1:XML
>>
>> At first, thank you for fast response. Of course I saw this example,
>> but I have situation, where I need to know packet details (pktlen,
>> mac, ifindex) along with information of conntrack entry which this
>> packet triggered.
>> I modified one of the libnetfilter_log example utilities to print both
>> (packet and conntrack) information together.
>> https://drive.google.com/file/d/1wx_LAjH57czHyFwTBSUvSnOkMchWEiiq/view?u=
sp=3Dsharing
>>
>> Is there any way to do the same in ulogd?
>
