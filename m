From: Phil Oester <kernel@linuxace.com>
Subject: Re: iptables as landmine subnet rejector
Date: Wed, 13 Nov 2013 14:17:12 -0800
Message-ID: <20131113221711.GA9944@home>
References: <CADju=b7zs7uGryLgM-R9_zSohh7Vknr52LL75Xx28dQyeEXgGw@mail.gmail.com>
 <CADju=b6PKTwOmO39YnHSd_6RxMfxgEDPV=jna-NzC2RSZYMSnQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADju=b6PKTwOmO39YnHSd_6RxMfxgEDPV=jna-NzC2RSZYMSnQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Mellander <jmellander@lbl.gov>
Cc: netfilter@vger.kernel.org

On Wed, Nov 13, 2013 at 09:58:13AM -0800, Jim Mellander wrote:
> For tcp, I tried the simpler
> -A INPUT -d a.b.c.d/xx-p tcp -j REJECT --reject-with tcp-reset

If this isn't intended for the firewall itself, you should not
add this to the INPUT chain.  Try FORWARD instead.

Phil
