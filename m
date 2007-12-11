From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Multihomed Problem
Date: Tue, 11 Dec 2007 16:04:10 -0600
Message-ID: <475F095A.7040003@riverviewtech.net>
References: <475EFFF8.1010606@nwcascades.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <475EFFF8.1010606@nwcascades.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 12/11/07 15:24, Jack Lauman wrote:
> I have a multihomed linux box set up as follows:
> 
> eth0: 192.168.100.1
> eth1: 192.168.1.1
> 
> I need to be able to print from a workstation at 192.168.100.2 to a 
> Xerox workstation at 192.168.1.30

Ok...

> How can I make this work?

Seeing as how (I'm betting) you can not set up routing on the Xerox, you 
will probably need to NAT the traffic from the 192.168.100.x network to 
appear as if it is from 192.168.1.1.  This way when any system on the 
192.168.100.x network tries to talk to the Xerox, it will think that 
192.168.1.1 is talking to it and thus be able to reply back.



Grant. . . .
