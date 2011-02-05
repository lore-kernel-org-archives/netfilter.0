From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Sat, 5 Feb 2011 11:56:30 -0200
Message-ID: <20110205115630.52c44e51@babalu.inexo.com.br>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<4D4B75C3.2060007@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4B75C3.2060007@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, 03 Feb 2011 21:42:59 -0600
Grant Taylor <gtaylor@riverviewtech.net> wrote:

> Once the traffic is in side of a VLAN tag (on the raw device), filters 
> will not match the traffic the say way that it did.  -  Try applying 
> your filters to the VLAN sub-interface.
> 
> This is because the traffic is no longer IP traffic in side of Ethernet 
> SNAP frames, but rather VLAN tagged frames that contain Ethernet SNAP 
> frames.

Is that a way to use instead of "protocol ip" use something like
"protocol 0x8100"??

What is the general form of "protocol ip" (if there is one)?
Some "u32 match" perhaps??

Ethy

