From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fwd: question about using conntrack to change the mark
Date: Mon, 21 Aug 2023 14:02:42 +0200
Message-ID: <ZONSYn2VHXlbRHX8@calendula>
References: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
 <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com>
 <ZOM8e8u+BK3jBNrE@calendula>
 <CAAUX2SVPgu5Mp8DAhEGzW7Y3UB2k++_qaVeZ3NbHZu4Yfw4bkw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAUX2SVPgu5Mp8DAhEGzW7Y3UB2k++_qaVeZ3NbHZu4Yfw4bkw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tony He <huangya90@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Aug 21, 2023 at 07:26:54PM +0800, Tony He wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> 于2023年8月21日周一 18:29写道：
[...]
> > https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821101751.4083-1-pablo@netfilter.org/
>
> This patch works when the conntrack sessions are not many. When there are about
> 300 sessions, another error "No buffer space available" is reported.
> 
> Works when sessions are not many:
> root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
> conntrack v1.4.7 (conntrack-tools): 204 flow entries have been shown.
> 204
> root@OpenWrt:~# ./conntrack -U -p tcp -m 1
[...]
> tcp      6 96 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=45714
> dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
> dport=45714 packets=6 bytes=11265 [ASSURED] mark=1 use=2
> conntrack v1.4.7 (conntrack-tools): Operation failed: No buffer space available

Another patch to fix this issue, thanks for reporting:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821120105.29538-1-pablo@netfilter.org/
