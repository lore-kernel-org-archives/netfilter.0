From: Jan Sarenik <jasan@x31.com>
Subject: Re: track the icmp packet.
Date: Thu, 6 Oct 2011 19:07:28 +0200
Message-ID: <20111006170727.GA10297@ams1.x31.com>
References: <CAGZFCEH59K7gFs5uNVdY_XQrAea+DT5Mes4OzOaxCOdnCtTWKw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGZFCEH59K7gFs5uNVdY_XQrAea+DT5Mes4OzOaxCOdnCtTWKw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi!

On Thu, Oct 06, 2011 at 09:41:48PM +0530, ratheesh kannoth wrote:
> I found a program at
> http://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO.txt.
> I modified a little for my purpose. But it is not working. Could you
> please guide me.

The program is an example of Netfilter kernel module - not the way to
go here.

You should better use the LOG target, e.g.

iptables -I INPUT -p icmp -j LOG --log-level=0 --log-prefix="My ping log: "

which will produce (after "ping localhost") something like:

My ping log: IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=4508 SEQ=1

  Best regards, Jasan
