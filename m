From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Fri, 01 Sep 2006 04:22:36 +0200
Message-ID: <44F7996C.9010504@plouf.fr.eu.org>
References: <20060831151130.GA32342@freesources.org>	<000601c6cd14$e07a28a0$0101000a@tanjian>	<20060831155749.GC32342@freesources.org>	<44F711D4.5090002@plouf.fr.eu.org>
	<20060901012054.GB23094@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060901012054.GB23094@freesources.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter-Users <netfilter@lists.netfilter.org>

Jonas Meurer a =E9crit :
>>
>>What do the "-d **.**.***.**/31" address ranges represent ?
>=20
> it is 62.75.128.98/31, which should be 62.75.128.98 and 62.75.128.99.

Actually I did not ask for their exact values but their meaning=20
network-wise. Because usually, when there is "-d <range>" in an INPUT=20
rule there is "-s <range>" in its OUTPUT counterpart or vice versa, but=20
both your INPUT and OUTPUT rule contain the same "-d <range>". So I was=20
wondering. Are these the client and server addresses ?

> let's say, ftp-servers are on port 9621 and 9721. then i need to open
> 9620 and 9720 as well for ftp, correct?

Yes. But I repeat that opening 9620 and 9720 is effective for active=20
mode only. Passive mode won't work.

> so what i am missing here:
> iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED \
>   -m multiport -p tcp --dports 9621,9721 -d 62.75.128.98/31 -j ACCEPT
> iptables -A OUTPUT -o eth0 -m state --state ESTABLISHED,RELATED \
>   -m multiport -p tcp --sports 9621,9721 -d 62.75.128.98/31 -j ACCEPT
> iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED \
                                              ^^^
No need for NEW in this rule. This is return traffic.

>   -m multiport -p tcp --dports 9620,9720 -d 62.75.128.98/31 -j ACCEPT
> iptables -A OUTPUT -o eth0 -m state --state NEW,ESABLISHED \
                                        typo here  ^^^^
>   -m multiport -p tcp --sports 9620,9720 -d 62.75.128.98/31 -j ACCEPT

I repeat : you don't need all those RELATED here (but they don't harm).

> after using exactly these commands, i'm still not able to connect to th=
e
> ftp-servers.
>
> if i try to login with lftp, it says [Connecting...], then
> [FEAT negotation...] and then it hangs forever at
> [Making data connection...].

This indicates that the control connection succeeds but the data=20
connection fails. Maybe lftp uses passive mode for the data connections=20
by default, then you have to disable it with "set ftp:passive-mode off"=20
so lftp uses active mode instead. You can also use the "debug" command=20
in lftp to get a more verbose output.

