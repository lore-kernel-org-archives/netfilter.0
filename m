From: Don Gould <don@bowenvale.co.nz>
Subject: Re: Traffic Accounting on Small System and User Limits.
Date: Fri, 29 Sep 2006 18:55:27 +1200
Message-ID: <451CC35F.9000207@bowenvale.co.nz>
References: <359501767.17840@mail.nankai.edu.cn>
	<359505980.29170@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <359505980.29170@mail.nankai.edu.cn>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



Bo Yang wrote:
>> 1. I want to keep a record of the amount of data each user uses
>> over a given amount of time.  I know the users IP number and their
>> MAC address.  I modified DNSMasq [1] to tell me this each time the
>> user issues a DHCP request.
> If you just want to get how many bytes a user used in a given range of
> time , iptalbes can do it very nicely !
> iptables -t filter -A forword  -s {your user ip}

Thanks very much.  I'll read up on that.

>> 2.  It is proposed that each MAC will be given 50mb of data to use.
>>  After this the user/MAC will have to be authorised to have more.
> You can use iptables quota module to accomplish this .

I'll read up on that as well.

>> The servers I'm using will run Debian Saige and are only small - p2
>>  or 3 with ~30 to 64mb ram and 2 - 3gb hard disk.  Each server only
>>  has to look after < 50 clients and in most cases wouldn't get more
>>  than 10 using it at a time.
> Oh , bad  hardware  ~

Yes.  Case of reusing something the customer already has.  My mission is
to get motels in my area giving away data to their customers for free in
the hope that I can then get interest from the city to do the same.

I want to show the advantages of giving tourists free access to
communications so they can show off our country to the world while
they're hear.

However we have to pay for data so I can't just do a 'free for all'.

Some motels charge their customers and are paying for better hardware.
I'm trying to find a balance.

Thank you very much again for your help.

Cheers Don
-- 
Don Gould
www.thinkdesignprint.co.nz - www.tcn.bowenvale.co.nz -
www.bowenvale.co.nz - www.hearingbooks.co.nz - SkypeMe:
ThinkDesignPrint - Good ideas:  www.solarking.co.nz



