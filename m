From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: viewing rules and traffic while inserting/removing rules
Date: Thu, 08 May 2008 14:21:30 -0500
Message-ID: <482352BA.50306@riverviewtech.net>
References: <4821E655.4010504@roth.lu> <090801c8b07c$fa084b60$5000040a@skathlaptop> <48232DD7.3070603@riverviewtech.net> <482335C2.2070004@roth.lu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482335C2.2070004@roth.lu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/08/08 12:17, lists+netfilter@roth.lu wrote:
> I do not need to keep individual accounting data for each network that 
> is blocked.

Ok.  In that case, I agree that an ipset would likely be a better way to 
go.  However you made a comment about it not being in your kernel.



Grant. . . .
