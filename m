From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: RE: dumb question...route from local eth1 to eth2 and vice versa
Date: Fri, 2 Dec 2005 08:04:09 +1100
Message-ID: <21108.6461124525$1133528401@news.gmane.org>
References: <438ECDEC.20106@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438ECDEC.20106@wildcash.com>
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

Keep in mind that if you want network games across a router, you will =
lose your broadcast packets unless you do something funky (unless its =
built in which I don't think it is). If you select the LAN option in a =
multiplayer game, 9 times out of 10 they use broadcast I've found. Use =
direct IP if you can. =20


Anthony Sadler
Far Edge Technology
w: (02) 8425 1400
=20
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rudi =
Starcevic
Sent: Thursday, 1 December 2005 21:18=20
To: netfilter@lists.netfilter.org
Subject: Re: dumb question...route from local eth1 to eth2 and vice =
versa

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
It's my fault for trying to hurry out a quick post just before I left =
work.

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



