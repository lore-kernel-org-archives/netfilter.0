From: Matt Singerman <msingerman@ncemch.org>
Subject: Re: Problems configuring iptables
Date: Wed, 23 Aug 2006 15:07:16 -0400
Message-ID: <44ECA764.8020205@ncemch.org>
References: <002e01c6c6e6$731fa7f0$9e0110ac@chaussy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002e01c6c6e6$731fa7f0$9e0110ac@chaussy>
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
To: pablo@blueoakdb.com
Cc: netfilter@lists.netfilter.org



Pablo Sanchez wrote:
>  
>
>   
>> -----Original Message-----
>> From: netfilter-bounces@lists.netfilter.org 
>> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
>> Matt Singerman
>> Sent: Wednesday, August 23, 2006 2:58 PM
>> To: Martijn Lievaart
>> Cc: netfilter@lists.netfilter.org
>> Subject: Re: Problems configuring iptables
>>
>> it took an extremely long time for the connection to go 
>> through.  Once it connected, it runs at normal speed, but it 
>> took a good 30 or 40 seconds for ssh to prompt me for my 
>> password.  What could be causing this?  I am guessing it is 
>> some sort of routing issue?
>>     
>
> Usually this means ssh isn't resolving properly.  I'd guess your
> /etc/resolv.conf file isn't setup properly.  Ensure the nameserver values
> point to your ISP.
>
> Cheers,
> ---
> Pablo Sanchez - Blueoak Database Engineering, Inc
> Ph:    819.459.1926          Toll free:  888.459.1926
> Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
> Fax:   603.720.7723 (US)
>
>
>   
Hi Pablo,

resolv.conf appears to be set up correctly.  Also, if I turn off the 
firewall and just let traffic flow through the bridge unfettered, 
connections are much snappier.  Actually, if I flush the rules, it is 
just as fast with the firewall off.  Any ideas what else it could be?

