From: whiplash <whiplash@bofhland.org>
Subject: Re: SIP services
Date: Tue, 03 Jun 2008 19:07:07 +0200
Message-ID: <48457A3B.2050402@bofhland.org>
References: <004401c8c587$72878500$6e00a8c0@wrh92000>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004401c8c587$72878500$6e00a8c0@wrh92000>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

marcos ha scritto:
> Hi list memembers,  i need to conect a  sip-pabx  micronet  sp5211 to inet ,
> it is behind  a  linux box with 2 networks cards , the former eth0  access
> to internet  , the  second  eth1 connects to lan, i am trying to use dnat to
> accept sip connection from internet  ,  but DNAT doesn't work

You need th SIP conntrack module.
It used to be in patch-o-matic, for older kernels.
