From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 17:06:29 +0100
Message-ID: <1266077189.2916.54.camel@tesla.lan>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bojan Sukalo <shukalo83@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
> I'am trying to setup nat on RHEL4 box.
> 
> Kernel: Linux 2.6.9-89.ELsmp x86_64x86
> iptables: 1.2.11

Bojan,

why don't you try to upgrade to a more recent version of iptables and if
possible to a more recent kernel ? You know, just in case...

I have a setup similar to yours (except from POSTROUTING which is of
type MASQUERADING rather than SNAT) and it works all right.

Also, have you checked other parameters such as TTL ? What about ICMP ?
You can enable ICMP with the following rule:

-A INPUT -p icmp -j ACCEPT

Guido

