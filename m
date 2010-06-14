From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Check for rule existence
Date: Mon, 14 Jun 2010 13:24:09 -0500
Message-ID: <4C1673C9.9000700@riverviewtech.net>
References: <AANLkTim0fkO6mhQqBlhAsW-I2blxkP36ld0Hk-W3kF42@mail.gmail.com> <AANLkTimA4wYL8mouRjiygbldj9rLui_vhh1zemVRcmQK@mail.gmail.com> <4C167362.1030201@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C167362.1030201@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/14/10 13:22, Taylor, Grant wrote:
> Depending on how system agnostic you are trying to bee, processing the 
> rule as if it were a command line (looking for individual pieces) will 
> probably be the easiest to do.

Also remember that IPTables(-save) is going to give you the output of 
what is in kernel.  Any host names that you specified in your rule will 
be translated to IPs and entered in the kernel as such.  This could be 
even more tricky if you have host names that are being translated to 
dynamic IPs.



Grant. . . .
