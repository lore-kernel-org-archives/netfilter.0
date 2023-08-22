From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fwd: question about using conntrack to change the mark
Date: Tue, 22 Aug 2023 12:00:12 +0200
Message-ID: <ZOSHLPD0hiCW32ZS@calendula>
References: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
 <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com>
 <ZOM8e8u+BK3jBNrE@calendula>
 <CAAUX2SVPgu5Mp8DAhEGzW7Y3UB2k++_qaVeZ3NbHZu4Yfw4bkw@mail.gmail.com>
 <ZONSYn2VHXlbRHX8@calendula>
 <CAAUX2SWXrkXKM_mNuc-4Sg7QTmPVt8JjE6GwWqSarmqFW1d46w@mail.gmail.com>
 <ZOR2+GwyMzPrECmd@calendula>
 <CAAUX2SUve335kp+RhWi6AxGZz0YXi9ArtJPswvTgNKv_qrQMLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAUX2SUve335kp+RhWi6AxGZz0YXi9ArtJPswvTgNKv_qrQMLQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tony He <huangya90@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Aug 22, 2023 at 05:46:06PM +0800, Tony He wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> 于2023年8月22日周二 16:51写道：
> >
> > On Tue, Aug 22, 2023 at 10:11:00AM +0800, Tony He wrote:
> > [...]
> > > I confirm this issue have been fixed. I even tried about 1000 flow entries.
> > > root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
> > > conntrack v1.4.7 (conntrack-tools): 1024 flow entries have been shown.
> > > 1024
> > > root@OpenWrt:~# ./conntrack -U -p tcp  -m 1
> > > tcp      6 7423 ESTABLISHED src=192.168.1.30 dst=10.40.9.83
> > > sport=53786 dport=80 packets=2 bytes=112 src=10.40.9.83
> > > dst=10.40.9.165 sport=80 dport=53786 packets=1 bytes=60 [ASSURED]
> > > mark=1 use=2
> > > tcp      6 103 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=57656
> > > dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
> > > dport=57656 packets=6 bytes=11265 [ASSURED] mark=1 use=2
> > > tcp      6 103 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=57000
> > > dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
> > > dport=57000 packets=7 bytes=11317 [ASSURED] mark=1 use=2
> > > tcp      6 103 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=55730
> > > dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
> > > dport=55730 packets=6 bytes=11265 [ASSURED] mark=1 use=2
> > > ......
> > > conntrack v1.4.7 (conntrack-tools): 1023 flow entries have been updated.
> > >
> > > After above issue is fixed, I can not reproduce "-f ipv4" issue. Seems
> > > that we don't need patch
> > >
> > > https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821102739.4893-1-pablo@netfilter.org/
> >
> > This is also required because conntrack -U/-D dumps the table from the
> > kernel, then it iterates over the list of entries. If the entry
> > expires, -U/-D will hit ENOENT, which should be ignored. This is
> > another regressions from 1.4.6.
>
> Sorry, I still don't quite understand. I mean if we don't add [1] and
> [2] , I can reproduce "Protocol error".
> However, after adding above [1] and [2], I can not reproduce "Protocol
> error" even though [3] is not added.
> Is [3] used to fix "Protocol error"? If yes, why it can not be
> reproduced by me? My test env is not changed.
> 
> [1] https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821101751.4083-1-pablo@netfilter.org/
> [2] https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821120105.29538-1-pablo@netfilter.org/
> [3] https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821102739.4893-1-pablo@netfilter.org/

[1] and [2] are sufficient to fix the problems that you reported.

[3] is a different issue that you did not report that I found while
reviewing this code.
