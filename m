From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Newbie request
Date: Tue, 12 Dec 2006 12:10:50 +0100 (CET)
Message-ID: <1267.193.173.119.247.1165921850.squirrel@webmail.sterenborg.info>
References: <457E5B99.7050005@gmail.com>
	<1153.193.173.119.247.1165912318.squirrel@webmail.sterenborg.info>
	<457E88D1.8020100@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457E88D1.8020100@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tue, December 12, 2006 11:47, Pascal Hambourg wrote:
> Hello,
>
> Rob Sterenborg a =EF=BF=BDcrit :
>
>>> My question is: Do I need a SNAT rule or should I try something with
>>> nat+FORWARD?
>>
>> No. You can just route from 192.168.0.0/24 to 192.168.1.0/24 and back
>> without using NAT.
>
> But then you need that host 192.168.0.10 has a route back to
> 192.168.1.0/24, either directly via eth1 IP address (so it'd better be
> fixed), or indirectly via the default gateway which must have a route t=
o
> 192.168.1.0/24 via eth1 IP address. Else you must do SNAT or MASQUERADE
> for 192.168.1.0/24 on eth1 :

Yes, I was assuming that the default gateway is set to the router's IP, b=
ut in
fact we don't know about the connection to the internet which is there
somewhere.

>> $ipt -A FORWARD -m state --state NEW -s 192.168.0.0/24 \
>> -d 192.168.1.0/24 -m mport -p tcp --dports 25,110 -j ACCEPT
>> $ipt -A FORWARD -m state --state NEW -s 192.168.1.0/24 \
>> -d 192.168.0.0/24 -m mport -p tcp --dports 25,110 -j ACCEPT
>>
>>
>> The last 2 rules can also be split into 4 rules if you don't have the =
mport
>>  module :
>
> Or just use the more standard 'multiport' match instead.

I keep getting confused with these two.. I thought it was mport but somed=
ay
I'll remember.


Grts,
Rob



