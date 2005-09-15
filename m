From: lst_hoe01@kwsoft.de
Subject: Re: 1. Switch Flooding 2. Chains traversal
Date: Thu, 15 Sep 2005 10:56:20 +0200
Message-ID: <20050915105620.hg7z7mdbzfy8skko@webmail.kwsoft.de>
References: <acf1defa050913213555e04129@mail.gmail.com>
	<20050914114214.srlhfxt1l1pck04w@webmail.kwsoft.de>
	<Pine.LNX.4.60.0509141538060.13360@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0509141538060.13360@darkstar.sysinfo.com>
Content-Disposition: inline
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

Zitat von "R. DuFresne" <dufresne@sysinfo.com>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On Wed, 14 Sep 2005 lst_hoe01@kwsoft.de wrote:
>
>> Zitat von venkata subramanian <venkatasubramanian@gmail.com>:
>>
>>> Hi,
>>> 1. Switch Flooding
>>>       We have a nice problem in our organisation. Due to viruses,
>>> some windows machine or the other starts flooding the network with
>>> packets. And, in the end, one of our switches comes down making us to
>>> manually restart the switch.
>>>       I don't (intuitively) see how iptables can help in this
>>> scenario.... But, I want to know whether any solution exists to this?
>>> If I make all the machine's gateway as a linux system, and rate limit
>>> the packets there will it help?
>>
>> Use a better switch. We once had a cheap 3Com (4300-48 Ports) which 
>> had the same
>> behavior with ping-flood to many invalid IP-Adresses. I guess it was a error
>> with the ARP handling. Once the switch was replaced by a 4400-48 (which is
>> really 3Com not re-branded crap) the problem was gone.
>> Best solution is of course to fix the virus-machines in your network.
>>
>
>
> Interesting, all sorts of advice and suggestions, except the real 
> answer, which would entertain the idea of finding the affending, 
> perhaps infected system<s> and fixing  or taking them off the network 
> till fixed.

You have not read my posting until the end ...

"Best solution is of course to fix the virus-machines in your network"

Regards

Andreas



