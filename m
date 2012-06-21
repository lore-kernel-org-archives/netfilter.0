From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: -f option used with iptables
Date: Thu, 21 Jun 2012 16:27:14 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206211626120.23123@frira.zrqbmnf.qr>
References: <CAE1WnGeiopf-gCWFzSVpZSDU6H56VqaPxL6K5AVL_o2xZm1pVw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGeiopf-gCWFzSVpZSDU6H56VqaPxL6K5AVL_o2xZm1pVw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2012-06-21 12:46, rahul shrivastava wrote:

>iptables -A INPUT -p icmp -i eth1 -m iprange --src-range
>172.31.114.1-172.31.114.254 -m iprange --dst-range 192.168.1.1-192.168.1.254
>-f -j DROP
>
>My abjective is to deny only fragmented packets with specified ip, protocol
>and interface and "-f" option doesnt seem to work

I can guarantee you that -f matches fragments -- if there are any
by the time the rule is executed.
