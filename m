From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Dynamic DNS
Date: Sat, 12 Mar 2005 10:25:59 -0500
Message-ID: <42330A07.8070605@SCampbell.net>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<422F5F90.6080005@SCampbell.net>
	<Pine.LNX.4.60.0503091748430.11874@darkstar.sysinfo.com>
	<42304A9A.7050207@SCampbell.net>
	<Pine.LNX.4.60.0503102052440.16999@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.60.0503102052440.16999@darkstar.sysinfo.com>
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

R. DuFresne wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On Thu, 10 Mar 2005, Steven M Campbell wrote:
>
>> R. DuFresne wrote:
>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On Wed, 9 Mar 2005, Steven M Campbell wrote:
>>>
>>>> Sebastian Docktor wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> I want to allow a Dynamic DNS Client to Access the SSH-Server on 
>>>>> my Firewall. But I don't want to open SSH for all IPs,
>>>>> Is it possible that iptables always looks up the ip address from 
>>>>> the hostname, so that only the ip has access which is registrated 
>>>>> under
>>>>> the dyndns?
>>>>>
>>>>>
>>>>
>>>> IMO, it's a very bad idea to lower the security of iptables 
>>>> firewall by making it dependent on DNS for any portion of 
>>>> authorization certification. DNS isn't exactly known for it's 
>>>> stellar security :) Allow me to suggest an alternate path.  Use RSA 
>>>> keyfiles and disallow ssh password authentication, this way you can 
>>>> leave the port open but user's without public keys installed on the 
>>>> server cannot gain access. Generally speaking DNS should have 
>>>> nothing to do with anyone's firewall because DNS would then become 
>>>> the weak link in the security chain and SSH has methods that are 
>>>> better applied to these needs.
>>>>
>>>
>>> Ahh, but this closes one sec loophole and pens another, sshd, which 
>>> has gotten hit with quite a few sec issues.  Keeping the sshd port 
>>> closed to the outside except a few 'special' systems makes the 
>>> likelyhood of a system compromise due to sshd extremely unlikely.
>>>
>>> Thanks,
>>>
>>> Ron DuFresne
>>> - -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>         admin & senior security consultant:  sysinfo.com
>>>                         http://sysinfo.com
>>>
>> I underscore my statement that it also reduces the effectiveness of 
>> the firewall by introducing the security challanged dynamic dns as an 
>> authentication model and possibly introducing new attacks based on 
>> the extension.   It is telling that, even though this is a fairly 
>> easy extension to implement, no one in the firewall marketplace does 
>> this and, IMO, for good reason.  In the specific case of the original 
>> poster I would:  Use ip tables to lock down access to the subnets 
>> where this dynamic device could appear and then use the SSH auth 
>> mechanism to deal with the hostname lookup and, as always, keep my 
>> applications (like SSH) up to date... or, even better, if I really 
>> want to call that client a secured host lock down it's address. For 
>> an internet based host a good port-knocking would fair far better 
>> than trusting dns.
>>
>
> That's not my disagreement.  I'd not rely upon DNS, yet I would not 
> leave sshd open not directly to the firewall, nor likely through it, 
> except to specific IP's, and those likely have to be static.  I missed 
> till a reread that you advised controls via sshd <and in most cases 
> tcpd as well>, which was my push in the thread, seems we agreeed all 
> along and I missed that <smile>.
>
> Thanks,
>
> Ron DuFresne
> - -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com

Yes, we both agree the best place to put the effort here would be to 
limit the ip address on that client machine, lock down to that address 
set and do what one can to keep sshd secured.   Using Dynamic DNS to 
determine who can gain access to ones firewall is like putting key under 
the front door mat.


