From: netfilter_user <netfilter_user@o2.pl>
Subject: Re[4]: PREROUTING
Date: Tue, 29 Apr 2003 17:59:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <11611759128.20030429175920@o2.pl>
References: <13955288009.20030429092330@o2.pl>
 <200304290949.10989.pc-secure@home.nl> <50633741.20030429145355@o2.pl>
 <200304291049.38735.Alistair@nerdnet.ca>
Reply-To: netfilter_user <netfilter_user@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304291049.38735.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: SaVaGE <pc-secure@home.nl>, netfilter@lists.netfilter.org

Hello Alistair,

Tuesday, April 29, 2003, 4:49:38 PM, you wrote:

AT> On April 29, 2003 08:53 am, netfilter_user wrote:
>> Hello SaVaGE,
>>
>> Tuesday, April 29, 2003, 9:49:10 AM, you wrote:
>>
>> S> Op dinsdag 29 april 2003 09:23, schreef netfilter_user:
>> >> Hello everyone,
>> >>
>> >> this is my problem:
>> >> My LAN is connected to Internet via Linux machine with 2 interface (
>> >> ppp0 - for internet and eth1 for local net). I need to connect from
>> >> local host, service that is running on port 23073 and 23083 UDP in
>> >> internet. For this i wrote afew rules with PREROUTING but when I start
>> >> script with rules below i receive:
>> >>
>> >> Bad argument `PREROUTING'
>> >> Try `iptables -h' or 'iptables --help' for more information.
>> >> Bad argument `PREROUTING'
>> >> Try `iptables -h' or 'iptables --help' for more information.
>> >>
>> >>
>> >> iptables -t nat -A PREROUTING -p udp -d 80.50.60.185 --dport 23073 -j
>> >> DNAT --to-destination 192.168.1.2 iptables -t nat -A PREROUTING -p udp
>> >> -d 80.50.60.185 --dport 23083 -j DNAT --to-destination 192.168.1.2
>> >>
>> >> iptables -A FORWARD -p udp -d 192.168.1.2 --dport 23073 -j ACCEPT
>> >> iptables -A FORWARD -p udp -d 192.168.1.2 --dport 23083 -j ACCEPT
>> >>
>> >> What maybe a reason of this msg?
>> >> Im using slackware 8.1 with iptables 1.2.6a
>>
>> S> This behaviour is correct NATting is done on the POSTROUTING table !!!!
>>
>>
>> S> Pascal (PC-Secure Dutch security service)
>>
>> ammm....im afraid its not correct because I have received msg like this:
>>
>>  Bad argument `PREROUTING'
>>  Try `iptables -h' or 'iptables --help' for more information.
>>  Bad argument `PREROUTING'
>>  Try `iptables -h' or 'iptables --help' for more information.
>>
>> ...its not correct in my newbe opinion.



AT>         Actually DNAT is acceptable in the PREROUTING chain.
AT>         change the --to-destination option to 
AT>         --to ip.ad.dr.ess:portnum
AT>         or 
AT>         --to ip.ad.dre.ss
        

Now I have to excuse everyone who answer on my mail... it is ofcourse
my fault. I made mistake and had written "iptables -t nat
PREROUTING..." and I should write like this "iptables -t nat -A
PREROUTING...". I have forgotten about "-A". Forgive me plz and thx
for your time and attention.

--
Best regards,
mailto:netfilter_user@o2.pl


