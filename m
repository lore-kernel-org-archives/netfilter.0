From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Fri, 26 Jun 2009 20:07:27 +0100 (WEST)
Message-ID: <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
    <4A44C5B2.9030408@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A44C5B2.9030408@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

>> Any guess? I can work without the modules as i am right now, i just want
>> to help if there's something wrong with the modules and help.
>
> Which kernel version are you using? The versions before 2.6.26 are
> known not to work properly. With later kernels you might have to
> set the sip_direct_media/signalling options to 0.

Hi Patrick,
kernel 2.6.30
Well, I'm going to test it with those parameters and let you know starting
next Monday.
One question, without the module everything works OK, the module are
really necessary? If so for what?

Jorge,

