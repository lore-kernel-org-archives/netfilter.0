From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: drop dhcp request from a particular mac address, after a dhcp
 relay
Date: Sun, 14 Mar 2010 16:36:52 -0500
Message-ID: <hnjktk$lie$1@dough.gmane.org>
References: <937499.80494.qm@web31506.mail.mud.yahoo.com> <4B9B4860.5010509@chello.at> <hngcvl$e12$1@dough.gmane.org> <alpine.DEB.2.00.1003132023260.16126@aurora.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1003132023260.16126@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/13/2010 01:29 PM, Sven-Haegar Koch wrote:
> On Sat, 13 Mar 2010, Robert Nichols wrote:
>
>> As for iptables, if you're using a high-level firewall builder to
>> generate the rules, then yes, it will probably reload the entire rule
>> set if you make any change.  If you work at a lower level and use the
>> 'iptables' command directly, then only the rule you add or change is
>> affected.  You can confirm that quite easily by running "iptables -vnL"
>> before and after the change and observing that the packet counts for
>> the other rules do not get reset.
>
> No, this is not correct.
>
> The iptables command downloads the whole ruleset from the kernel,
> including current counter values, modifies the downloaded version, and
> then uploads the whole resulting ruleset (again, with counter
> values) into the kernel again.
>
> This "download whole ruleset, modify in userspace, upload" cycle is why
> iptables-restore is so much faster than multiple calls to the iptables
> program - it only downloads once, applies all changes from the input,
> and then uploads back to the kernel once.

Indeed!  I looked at the iptables source, and that's exactly what happens.

Learn something new every day.  Thanks for the correction.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

