From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: simple connection bridging
Date: Sun, 13 Apr 2008 21:02:03 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>  <4801622E.1060407@bofhland.org> <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Boughton <boughtonp@gmail.com>
Cc: whiplash <whiplash@bofhland.org>, netfilter@vger.kernel.org


On Sunday 2008-04-13 13:10, Peter Boughton wrote:
>On Sun, Apr 13, 2008 at 2:30 AM, whiplash <whiplash@bofhland.org> wrote:
>>  You don't need iptables at all.
>>  Just enable packet forwarding on the linux box:
>>
>>  echo "1">/proc/sys/net/ipv4/ip_forward
>>
>>  and add appropriate routing rules on both Xp machines:
>>
>>  on 192.168.1.2
>>  route add 192.168.0.0 mask 255.255.255.0 192.168.1.1
>>
>>  on 192.168.0.3
>>  route add 192.168.1.0 mask 255.255.255.0 192.168.0.1
>>
>>  (I'm assuming both networks are /24)

No need. If you add the interface address, rules for the subnet
will automatically be added, in other words:

	ip addr add 192.168.1.2/24 dev eth0

will cause 192.168.1.0/24 to show up in `ip route` (preferred over `route`)
with a 'proto kernel', which says the kernel created this one automatically.
