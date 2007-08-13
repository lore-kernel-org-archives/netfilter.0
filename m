From: "=?UTF-8?B?0JrQsNC90LjQstC10YYg0J3QuNC60L7Qu9Cw0Lk=?="
	<n_kanivets@futureservice.ru>
Subject: Re: trying to block an internal ip
Date: Mon, 13 Aug 2007 08:32:05 +0400
Message-ID: <001f01c7dd62$e6d990a0$0511a8c0@Sklifer>
References: <46BFCCE8.7000300@network1.ca>
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
To: Blake Patton <pattonb@network1.ca>, netfilter@lists.netfilter.org

Hello Blake,

packets are put into INPUT chain when they are destined to the filtering
machine itself.
packets are put into OUTPUT chain when thay are originated from the
filtering machine itself.
packets are put into FORWARD chain when they are going transit through the
filtering machine.

so, if you need to block pass through traffic from 192.168.31.208 and your
incoming (internal) interface is $CLEANIF1, then you have to specify
/sbin/iptables -A FORWARD -i $CLEANIF1 -s 192.168.31.208 -j DROP

moreover, be sure that you do not have ACCEPT rule on your list above that
matches this source and this incoming interface also.

check the "order of going through tables and chains" in iptables tutorial.

regards,
Nikolay
e-mail: n_kanivets@futureservice.ru

----- Original Message -----
From: "Blake Patton" <pattonb@network1.ca>
To: <netfilter@lists.netfilter.org>
Sent: Monday, August 13, 2007 7:15 AM
Subject: trying to block an internal ip


>
> --
> I have been trying to block all traffic from an internal ip address, and
packets are still going out, (seen with tcpdump) I don't see any traffic
coming in for that ip. here are the rukles I have put in place.
>
> /sbin/iptables -A INPUT -i $CLEANIF1 -s 192.168.31.208 -j DROP
> /sbin/iptables -A INPUT -i $CLEANIF1 -d 192.168.31.208 -j DROP
>
> I thought this would shut down 192.168.31.208, however that is not the
case. any advice would be appreciated.
>
>
>
>
>
>


