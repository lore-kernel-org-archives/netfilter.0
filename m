From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Diverting part of the traffic over a bridged network
Date: Mon, 10 Aug 2009 01:41:44 +0200
Message-ID: <94012beb8601c0f82a9af6271fd7f0fb@localhost>
References: <9c567de70908090726s72bb3678j4c24db8f2c89a1ef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9c567de70908090726s72bb3678j4c24db8f2c89a1ef@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 9 Aug 2009 16:26:27 +0200, Remi Pieternella wrote:
> On my network I have a music box (Sonos) which needs to be visible on
> my 192.168.0.x subnet (other wise my other computers will not be able
> find it). But for which I would like to divert all non local to an
> external gateway (possibly through a VPN connection)

Why don't you just hook up the music box to the regular physical link and
configure a different default gateway for it?

PS. Sorry for the PM, Remi.
