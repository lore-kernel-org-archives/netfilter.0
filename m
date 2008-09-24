From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ULOG/NFLOG on a non-forwarding machine
Date: Tue, 23 Sep 2008 21:57:54 -0500
Message-ID: <48D9ACB2.80502@riverviewtech.net>
References: <m38wtjur74.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m38wtjur74.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 9/23/2008 4:50 AM, Benny Amorsen wrote:
> Is there a way to catch incoming traffic which is neither INPUT nor 
> FORWARD with netfilter?

You /might/ be able to catch some traffic *if* the Linux TCP/IP stack 
thought that it was appropriately addressed to the system.

I think you will have better luck doing this with bridging as bridging 
is (more) accustom to dealing with traffic that may or may not be 
addressed to the local system.

It may be possible to get IPTables to log some information about packets 
that it thinks are completely erroneous, but I'm thinking that if it is 
possible, it will be severely limited.



Grant. . . .
