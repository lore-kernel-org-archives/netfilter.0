From: tepesu@australia.edu
Subject: Re: Re: iptables and TOS 15
Date: Mon, 15 Nov 2004 13:35:04 +0200
Message-ID: <41996f3e.2305.0@australia.edu>
Reply-To: tepesu@australia.edu
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: Lopsch <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org


    first i use imq patch for kernel 2.6.9 and htb for some traffic
management and i want to redirect this kind of trafic to imq1 or imq0 and
then to came with some htb rules. just this ...

#iptables -t mangle -A PREROUTING -m tos --tos 0x15 -j IMQ --todev 0
iptables v1.2.11: Bad TOS value `0x15'
Try `iptables -h' or 'iptables --help' for more information.

#iptables -t mangle -A PREROUTING -m tos --tos 15 -j IMQ --todev 0
iptables v1.2.11: Bad TOS value `15'
Try `iptables -h' or 'iptables --help' for more information.



>
>Please post it also to the list so more people can help ;). Only for 
>understanding: Your ISP marks some pakets with TOS 15, what exactly do 
>you want to do, only filter them out or mark them with any kind of 
>number so that the traffic shaper uses it? For further questions about 
>shaping etc. refer to www.lartc.org howto an their mailinglist perhaps 
>there waits better help for such questions.
>
>as Jason wrote you could use a rule like this:
>
>iptables -t mangle -A PREROUTING -m tos --tos 15 [ ... ]
>
>the  value is also accepted as hex
>
>iptables -t mangle -A PREROUTING -m tos --tos 0x15 [ ... ]
>
>where [...] means that=B4s then up to you what action you perform on that> 
>pakets.
>iptables -t mangle -A PREROUTING -m tos --tos 15 -j DROP
>for example would drop all TOS 15 pakets.
>iptables -t mangle -A PREROUTING -m tos --tos 15 -j MARK --mark n
>would mark all TOS 15 pakets with the value n for further use for 
>example traffic shaping.
>
>




