From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: dumb question...route from local eth1 to eth2 and vice versa
Date: Thu, 01 Dec 2005 20:18:20 +1000
Message-ID: <438ECDEC.20106@wildcash.com>
Reply-To: tech@wildcash.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

>> I think ip_a_route_1.sh is way too difficult for this setup. I didn't
>> even read it all through (saw something about tables, rules
>> and prio)..
Very true, but it's the only way I know.

>> ifconfig eth0 192.168.3.10 netmask 255.255.255.0 up
>> ifconfig eth1 192.168.1.1 netmask 255.255.255.0 up
>> route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.168.3.254
Nice one .....

>> You did not set the policy of FORWARD to DROP. It will DROP
>> nothing.
>> You did not set the policy of OUTPUT to DROP. The OUTPUT >> rules are
useless because everything will be accepted, even
>>  without these rules.
Yes sorry. I didn't cut'n'paste that part of the script in.
It's my fault for trying to hurry out a quick post just before I left work.

>>  He just needs to allow
>> forwarding between these to interfcaes and let routing do the
>>  rest.
>> Your scripts are doing something different.
Yes ... but I thought it would be handy to have net too so
all the boys and girls and play online together as well :-)

Using things like tables, rules and prio also puts one in place
to do QOS on the network traffic with the tc command.

Don't want those pesky emails, downloads and other important
stuff to lag out the gaming connection ... :-) lol .....

Cheers,
Rudi

