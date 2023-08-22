From: Tony He <huangya90@gmail.com>
Subject: Re: Fwd: question about using conntrack to change the mark
Date: Tue, 22 Aug 2023 10:11:00 +0800
Message-ID: <CAAUX2SWXrkXKM_mNuc-4Sg7QTmPVt8JjE6GwWqSarmqFW1d46w@mail.gmail.com>
References: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
 <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com>
 <ZOM8e8u+BK3jBNrE@calendula> <CAAUX2SVPgu5Mp8DAhEGzW7Y3UB2k++_qaVeZ3NbHZu4Yfw4bkw@mail.gmail.com>
 <ZONSYn2VHXlbRHX8@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692670270; x=1693275070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUDV85NF+4b80ZNOwPYlwiDaWrC06pira3rBavvtPec=;
        b=M6RxJbpwU2CzSJX7CljQKqTToS9a53rzoThzTtsI997rnWrc6xGc1a54F7YlG33KWQ
         55+V4RtSI9+7CdULM8PAb+6Sj9nFJUIfY9UDy6o4tvOo9cCGe8uYeI9Bqhwk+W+Rwnpc
         cM4yZRu+qBOdCqC7uzAgZ+rIpkE3xzWdxYPAIl4gvRLJzxVs5nZCmmWf8odiBLVR8fe1
         QM6AYvv0i9++m/SwRSQBomn1BubpTfYgON4ji9RLTNlGU97W7HR2QwxZv2afzDwhxzVz
         mQnqZCRTP+zVwPB36L8o4zIe8GO9lNrd6OU9TlMmqBUhJniGmERw8bGn0x+z54UtEmUS
         sfpw==
In-Reply-To: <ZONSYn2VHXlbRHX8@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Pablo Neira Ayuso <pablo@netfilter.org> =E4=BA=8E2023=E5=B9=B48=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=B8=80 20:02=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Aug 21, 2023 at 07:26:54PM +0800, Tony He wrote:
> > Pablo Neira Ayuso <pablo@netfilter.org> =E4=BA=8E2023=E5=B9=B48=E6=9C=
=8821=E6=97=A5=E5=91=A8=E4=B8=80 18:29=E5=86=99=E9=81=93=EF=BC=9A
> [...]
> > > https://patchwork.ozlabs.org/project/netfilter-devel/patch/2023082110=
1751.4083-1-pablo@netfilter.org/
> >
> > This patch works when the conntrack sessions are not many. When there a=
re about
> > 300 sessions, another error "No buffer space available" is reported.
> >
> > Works when sessions are not many:
> > root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
> > conntrack v1.4.7 (conntrack-tools): 204 flow entries have been shown.
> > 204
> > root@OpenWrt:~# ./conntrack -U -p tcp -m 1
> [...]
> > tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D457=
14
> > dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 s=
port=3D80
> > dport=3D45714 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
> > conntrack v1.4.7 (conntrack-tools): Operation failed: No buffer space a=
vailable
>
> Another patch to fix this issue, thanks for reporting:
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821120105=
.29538-1-pablo@netfilter.org/
I confirm this issue have been fixed. I even tried about 1000 flow entries.
root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
conntrack v1.4.7 (conntrack-tools): 1024 flow entries have been shown.
1024
root@OpenWrt:~# ./conntrack -U -p tcp  -m 1
tcp      6 7423 ESTABLISHED src=3D192.168.1.30 dst=3D10.40.9.83
sport=3D53786 dport=3D80 packets=3D2 bytes=3D112 src=3D10.40.9.83
dst=3D10.40.9.165 sport=3D80 dport=3D53786 packets=3D1 bytes=3D60 [ASSURED]
mark=3D1 use=3D2
tcp      6 103 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57656
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D57656 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 103 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57000
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D57000 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 103 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D55730
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D55730 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
......
conntrack v1.4.7 (conntrack-tools): 1023 flow entries have been updated.


After above issue is fixed, I can not reproduce "-f ipv4" issue. Seems
that we don't need patch
https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821102739.4=
893-1-pablo@netfilter.org/

We only need
https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821101751.4=
083-1-pablo@netfilter.org/
and
https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821120105.2=
9538-1-pablo@netfilter.org/

Does it make sense at source code level?

root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
conntrack v1.4.7 (conntrack-tools): 1027 flow entries have been shown.
1027
root@OpenWrt:~# ./conntrack -U -p tcp -f ipv4 -m 1
tcp      6 64 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43410
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D43410 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 68 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44160
dport=3D80 packets=3D5 bytes=3D268 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44160 packets=3D3 bytes=3D172 [ASSURED] mark=3D1 use=3D2
tcp      6 63 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D39350
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D39350 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 64 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45470
dport=3D80 packets=3D9 bytes=3D578 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45470 packets=3D9 bytes=3D13678 [ASSURED] mark=3D1 use=3D2
......
......
conntrack v1.4.7 (conntrack-tools): 1026 flow entries have been updated.
