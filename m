From: Phil Oester <kernel@linuxace.com>
Subject: Re: iptables as landmine subnet rejector
Date: Tue, 19 Nov 2013 08:23:57 -0800
Message-ID: <20131119162357.GA13678@home>
References: <CADju=b7zs7uGryLgM-R9_zSohh7Vknr52LL75Xx28dQyeEXgGw@mail.gmail.com>
 <CADju=b6PKTwOmO39YnHSd_6RxMfxgEDPV=jna-NzC2RSZYMSnQ@mail.gmail.com>
 <20131113221711.GA9944@home>
 <CADju=b5v+BhTrqXm1gm5h8Q6vB-ufV_FLRcg8cjA75zV9rfvgQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADju=b5v+BhTrqXm1gm5h8Q6vB-ufV_FLRcg8cjA75zV9rfvgQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Mellander <jmellander@lbl.gov>
Cc: netfilter@vger.kernel.org

On Thu, Nov 14, 2013 at 09:12:07AM -0800, Jim Mellander wrote:
> tcpdump output:
> 1384448210.669303 IP bad_host.23870 > landmine_host.61871: UDP, length 20
> 1384448210.669325 IP myip > bad_host ICMP bad_host udp port 61871
> unreachable, length 56
> 
> Note that the ICMP port unreachable didn't come from landmine_host, as expected.

That is how the REJECT target works.  The ICMP will come from the gateway.

Phil
