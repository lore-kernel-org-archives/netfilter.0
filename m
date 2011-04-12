From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: iptables - external IP address on internal interface?
Date: Tue, 12 Apr 2011 15:31:11 -0500
Message-ID: <io2cqf$lba$1@dough.gmane.org>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>	 <1302544375.1551.11.camel@andybev>	 <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local> <1302636361.4938.9.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302636361.4938.9.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/12/2011 02:26 PM, Andrew Beverley wrote:
>
>>> Can you post the iptables rules that you are using, in particular the
>>> NAT part? What IP address range are you using on the internal network?
>>
>> As requested - output of "iptables -nL"
>>
>
> Having scanned the list of rules (which were pretty difficult to read
> due to line wrapping) I cannot see any SNAT/MASQUERADE targets? If so, I
> would have thought that the behaviour you are seeing is to be expected.

The command "iptables -nL" will show only the "filter" table, so of course
there are no NAT rules shown.

The output from "iptables-save" will be all-inclusive.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

