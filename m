From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: 1. Switch Flooding 2. Chains traversal
Date: Wed, 14 Sep 2005 15:42:33 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0509141538060.13360@darkstar.sysinfo.com>
References: <acf1defa050913213555e04129@mail.gmail.com>
	<20050914114214.srlhfxt1l1pck04w@webmail.kwsoft.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050914114214.srlhfxt1l1pck04w@webmail.kwsoft.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: lst_hoe01@kwsoft.de
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 14 Sep 2005 lst_hoe01@kwsoft.de wrote:

> Zitat von venkata subramanian <venkatasubramanian@gmail.com>:
>
>> Hi,
>> 1. Switch Flooding
>>       We have a nice problem in our organisation. Due to viruses,
>> some windows machine or the other starts flooding the network with
>> packets. And, in the end, one of our switches comes down making us to
>> manually restart the switch.
>>       I don't (intuitively) see how iptables can help in this
>> scenario.... But, I want to know whether any solution exists to this?
>> If I make all the machine's gateway as a linux system, and rate limit
>> the packets there will it help?
>
> Use a better switch. We once had a cheap 3Com (4300-48 Ports) which had the 
> same
> behavior with ping-flood to many invalid IP-Adresses. I guess it was a error
> with the ARP handling. Once the switch was replaced by a 4400-48 (which is
> really 3Com not re-branded crap) the problem was gone.
> Best solution is of course to fix the virus-machines in your network.
>


Interesting, all sorts of advice and suggestions, except the real answer, 
which would entertain the idea of finding the affending, perhaps infected 
system<s> and fixing  or taking them off the network till fixed.

In seeking other solutions to this problem I get the impression there are 
other problems in the institution itself that need to be rectified.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDKH0sst+vzJSwZikRAi3xAKDQhQCFWNVdY0evvMK0fQbXfKaDZgCeLixk
cOVGYPLTVPR4y5G29PqfoME=
=zDJJ
-----END PGP SIGNATURE-----

