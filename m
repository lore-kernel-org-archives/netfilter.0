From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Portsweep
Date: Wed, 24 Sep 2008 08:55:56 -0500
Message-ID: <48DA46EC.7070607@riverviewtech.net>
References: <194384.45623.qm@web55301.mail.re4.yahoo.com> <48D9534B.4080602@riverviewtech.net> <48D9F358.3020005@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D9F358.3020005@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/24/08 02:59, John Haxby wrote:
> FWIW, my Netgear DG834N has this in a chain called DOS:
> 
> SCAN       all  --  anywhere             anywhere           psd 
> weight-threshold: 21 delay-threshold: 300 lo-ports-weight: 3 
> hi-ports-weight: 1
> 
> Netgear make their source available so you could try looking there.

I was wondering if it was not possible to make the psd match have a wild 
card in it like a netmask that would drop some of the least significant 
bits thus watching a larger range (network).  It looks like it might 
indeed do that.



Grant. . . .
