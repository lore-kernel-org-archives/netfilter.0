From: "Karel Rericha" <karel@maxtel.cz>
Subject: Re: block tcp packet.
Date: Wed, 29 Oct 2008 09:45:59 +0100
Message-ID: <5b19ed110810290145t4a0aaf4cg2fdd784bce8ae92c@mail.gmail.com>
References: <98f5d92c0810241600r7d44b366u8c0b84c917a4c8b9@mail.gmail.com>
	 <5b19ed110810270139s7304f5c1k3af524afdf991378@mail.gmail.com>
	 <98f5d92c0810270811l6463705dyad43c3be69008c4a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <98f5d92c0810270811l6463705dyad43c3be69008c4a@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Servers 4you <servers4you@gmail.com>
Cc: netfilter@vger.kernel.org

2008/10/27 Servers 4you <servers4you@gmail.com>:
> i was reading about U32 match, but i think its used to work with packet
> headers, not with data.

I am not sure but I think you can trick u32 to match data in packet
with positive offset as you can reach frame header with negative
offset. But I never tried myself. Maybe someone on list did ?

Karel
