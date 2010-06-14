From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Check for rule existence
Date: Mon, 14 Jun 2010 13:25:23 -0500
Message-ID: <4C167413.2060003@riverviewtech.net>
References: <AANLkTim0fkO6mhQqBlhAsW-I2blxkP36ld0Hk-W3kF42@mail.gmail.com> <AANLkTimA4wYL8mouRjiygbldj9rLui_vhh1zemVRcmQK@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimA4wYL8mouRjiygbldj9rLui_vhh1zemVRcmQK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/14/10 12:23, Curby wrote:
> Hopefully others will have more to add. =)

You might want to look in to the "comment" match extension.

You could add a comment to rules that you are entering, and then look 
for said comment as a flag when looking for the rule.  That way you 
wouldn't have to process nearly as much, because you can look for your 
own flag.



Grant. . . .
