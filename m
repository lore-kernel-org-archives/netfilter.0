From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Re: monitoring data transfer stats of current connections
Date: Fri, 16 Nov 2012 02:17:49 +0200
Message-ID: <CAAo+KFkbt5_u6xYjdAO=48BUpVN9uOxkuHKWwNNO0=Bujey0Eg@mail.gmail.com>
References: <CAAo+KFnKuwCCF3Wfb3vPHZw3gSSTLGyfSPvbE5whxDPrrRHKVg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=/r1B2OTmNHN+ZmaOSfX8aeTUXfvh2G98DQaXVRfIUOw=;
        b=VTXpjZrTthHmZFKdh0bzDUOUh7m3aK8KAzLahTE9BXlpw0wgbDwU+THMa83D6uIW0r
         9wG403EuqCXWE2JLhFPWaG/aKOpxijFPv45OuD1s8+lnjP05XVJzNxFJkPikL8nxnMfn
         bTnWObPLtJEL1jI/lccyzoCOlNbnFns7ZSSouKuim1jsEs4LAze9KCFKhZ+2rlb1oxPx
         akvPH2tTBORPIraMo8G9RZb+kW8lpZVxOlP/JerqJfTc+YJ+UX9D1M8tYPT4q0Lv+qCP
         KC3S+VlNEWP7pbD+RVXsp5PWYWRVnxDnCeHcrO9leGUz5P2RQ5Bn9GBnWraxUVl2tJ79
         /DrQ==
In-Reply-To: <CAAo+KFnKuwCCF3Wfb3vPHZw3gSSTLGyfSPvbE5whxDPrrRHKVg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am replying my own question:

The answer in conntrack accounting.

sysctl -w net.netfilter.nf_conntrack_acct=1


tcp      6 299 ESTABLISHED src=144.111.111.11 dst=192.168.1.2
sport=35042 dport=22 packets=585 bytes=41244 src=192.168.1.2
dst=144.111.111.11 sport=22 dport=35042 packets=423 bytes=195796
[ASSURED] mark=0 use=2

Thank you,

--
Oguz YILMAZ


On Fri, Nov 16, 2012 at 2:11 AM, Oguz Yilmaz <oguzyilmazlist@gmail.com> wrote:
> Hello,
>
> Is it possible to reach current rx/tx information for each connection
> without having to listen with pcap or redirecting to a user space
> daemon?
>
> Regards,
>
> note: from freebsd session table:
>
> all tcp 31.160.60.10:443 <- 91.10.177.169:53315       ESTABLISHED:ESTABLISHED
>    [231786895 + 65535](+2304119762)  [2922147009 + 65535](+2119412158)
>    age 00:01:38, expires in 24:00:00, 1307:1619 pkts, 60892:1696057
> bytes, rule 2
>    id: 50535525b07ac0c0 creatorid: 21eda4d4
>
>
> --
> Oguz YILMAZ
