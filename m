From: Brian S Julin <BJulin@clarku.edu>
Subject: RE: Do I need ipt_ROUTE to do this?
Date: Wed, 14 Nov 2007 16:27:19 -0500
Message-ID: <5A630F46702DD1498FFD48394B4A664C27DD5913@john.ad.clarku.edu>
References: <5A630F46702DD1498FFD48394B4A664C27DD5909@john.ad.clarku.edu>,<473B23AE.9010106@riverviewtech.net>,<5A630F46702DD1498FFD48394B4A664C27DD590E@john.ad.clarku.edu>
 <5A630F46702DD1498FFD48394B4A664C27DD5910@john.ad.clarku.edu>,<473B51B7.70200@riverviewtech.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <473B51B7.70200@riverviewtech.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>



On 11/14/07 11:29, Brian S Julin wrote:
>> A couple other ways this could happen would be to get iproute to run
>> the routing decision twice after pulling the traffic out of the stack
>> and reinjecting it.  Another would be if there were floating around
>> some iptables/ebtables match module that could pre-match against a
>> kernel routing table (by source or destination) PREROUTING. Then a
>> mark could be put on and iproute2 would just follow that.
>
>I'm wondering if IPSet would be able to help you out here.  If you had a
>set that contained the IPs for one route and another set that contained
>the IPs for the other route, you could match and mark based on set's and
>thus use marks to decide how to handle the traffic.  To pull this off
>you would just need something to update the ip sets in decent time.
>Granted your sets will probably contain net blocks, not IPs.

Yeah it's that "something to update" that I'm trying to decide on.
I could write a script easy, but a preferable solution would not be
glued together that way.  Maybe I should look into making the kernel
auto-create some read-only user-visible ipsets when it creates
rp_tables.

I take it the iproute2 and netfilter stuff is not quite yet sharing code at this
point (I haven't looked)?


