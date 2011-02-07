From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Linux bridge/switch port mirroring/SPAN/port monitoring/Roving
 Analysis?
Date: Mon, 7 Feb 2011 08:50:55 +0100
Message-ID: <20110207085055.0acf6040@catus>
References: <AANLkTikP+f97ohiY6DCi-zogvde=d-rji8txa9RPGJd8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikP+f97ohiY6DCi-zogvde=d-rji8txa9RPGJd8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Erik Andersen <erik.b.andersen@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

>Is there a way to port mirroring/SPAN on a linux bridge? If so, what
>would I need to do to set it up? I'm hoping to port morror to
>vboxnet0.

Mirroring functionality is build into ifb[1]. There's tc action "mirred
egress mirror" which, used in a proper context, can mirror ingress
and/or egress traffic to other interface. In your case, mirrored
interface would be br0.

Here [2] our colegue is describing ingress mirroring from eth1 to
eth2-5.

And important note here [3] about using "protocol all" in tc filter, if
you also want to get non-ip traffic mirrored.

[1]
http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb#IFB_Example
[2] http://marc.info/?l=linux-netdev&m=128853067804910&w=2
[3] http://marc.info/?l=linux-netdev&m=128861016403775&w=2

Best regards,
Marek Kierdelewicz
