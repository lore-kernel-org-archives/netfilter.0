From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Waiting until first release of NFTABLES
Date: Sat, 14 Mar 2020 02:01:17 +0100
Message-ID: <070255db-7beb-d19e-a73f-ac95f0bcc4c2@thelounge.net>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
 <24ef6251-fc23-b0f6-e721-85c443dc391f@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <24ef6251-fc23-b0f6-e721-85c443dc391f@satchell.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org



Am 13.03.20 um 23:05 schrieb Stephen Satchell:
> On 2/19/20 3:41 PM, Stephen Satchell wrote:
>> I'm concerned that Centos 8 is using a pre-release version of nftables. 
> 
> So, with China starting to ramp up its network penetration, I'm going to
> set aside CentOS 8 and instead bring up Centos 7.6 and continue to use
> IPTABLES with my existing ruleset, with my BCP-38 addition to
> NetworkManager plus turning on rp_filter.
> 
> Once the NFTABLES project reached 1.0 or so (wait for 1.1?) and it's in
> the CentOS 8 respositories, I can spin up a CentOS 8 instance and start
> experimenting.

you still don't understand versioning of opensource and the linux kernel
at all! the parts which are doing *really* the work don't have anything
to do with the userland tool because they are part of the kernel
