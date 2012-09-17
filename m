From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptables port redirect question
Date: Mon, 17 Sep 2012 09:31:39 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1209170930070.17239@nerf07.vanv.qr>
References: <20120917110300.5e546d0c@shiva.selfip.org> <3980014.EOsJlpYLpK@alaris> <20120917124720.433e03c4@shiva.selfip.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120917124720.433e03c4@shiva.selfip.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joydeep.bakshi@infoservices.in
Cc: =?UTF-8?Q?Michal_Kube=C4=8Dek?= <mkubecek@suse.cz>, netfilter@vger.kernel.org


On Monday 2012-09-17 09:17, joydeep.bakshi@infoservices.in wrote:
>
>Actually my requirement is fulfilled by routing everything excluding lo and
>local lan.

Routing is always performed by definition.
(Packets are routed, interfaces are not.)

