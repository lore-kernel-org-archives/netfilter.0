From: Mark Coetser <mark@pkfnet.co.za>
Subject: Re: filter all outgoing frames with specific client hardware address
Date: Mon, 29 Jan 2018 16:03:51 +0200
Message-ID: <161423b3158.27ce.011a82e1253448b704705c1b47ed667a@pkfnet.co.za>
References: <F5452071F098E84B91D98FDE02860FAAF14C9FD3@ex-mb1.corp.adtran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F5452071F098E84B91D98FDE02860FAAF14C9FD3@ex-mb1.corp.adtran.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: IMMO WETZEL <IMMO.WETZEL@adtran.com>, netfilter@vger.kernel.org

iptables -A INPUT -m mac --mac-source $hardware -m udp -p udp --dport 67 -j 
DROP

-- Thank you,

Mark Adrian Coetser
mark@pkfnet.co.za





On 29 January 2018 3:59:22 PM IMMO WETZEL <IMMO.WETZEL@adtran.com> wrote:

> HI,
>
> I do have a linux router which forwards a couple of frames. I do like to 
> filter (DROP) all dhcp frames with an specific dhcp client hw address.
> How can I do this ?
>
> Immo
>
> This message has been classified Public by IMMO WETZEL on Montag, 29. 
> Januar 2018 at 14:56:58.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


