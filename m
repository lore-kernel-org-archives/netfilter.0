From: netfilter_user <netfilter_user@o2.pl>
Subject: Re[6]: access to server
Date: Wed, 30 Apr 2003 19:00:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14214146080.20030430190056@o2.pl>
References: <5436369716.20030430004931@o2.pl>
 <20030430044745.621e715a.arnt@c2i.net> <211627560.20030430153217@o2.pl>
 <200304301059.48917.Alistair@nerdnet.ca>
Reply-To: netfilter_user <netfilter_user@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304301059.48917.Alistair@nerdnet.ca>
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
Cc: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

Hello Alistair,

Wednesday, April 30, 2003, 4:59:48 PM, you wrote:

AT> On April 30, 2003 09:32 am, netfilter_user wrote:
>> Hello Arnt,
>>
>> Wednesday, April 30, 2003, 4:47:45 AM, you wrote:
>>
>> AK> On Wed, 30 Apr 2003 03:38:12 +0200,
>> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>>
>> AK> <1246491441.20030430033812@o2.pl>:
>> >> Hello Arnt,
>> >>
>> >> Wednesday, April 30, 2003, 3:10:30 AM, you wrote:
>> >>
>> >> AK> On Wed, 30 Apr 2003 00:49:31 +0200,
>> >> AK> netfilter_user <netfilter_user@o2.pl> wrote in message
>> >>
>> >> AK> <5436369716.20030430004931@o2.pl>:
>> >> >> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multioport --dport
>> >>
>> >> AK>                                                      /\
>> >> AK> ..is " -m --multioport " a valid match in iptables, or a correct
>> >> AK> quote of your attempt to write  ' -m --multiport ' ?
>> >>
>> >> damn my wrong...it should looks like this:
>> >> iptables -A FORWARD -i eth1 -p udp -m --multioport --dport 23073,23083
>> >> -j ACCEPT                                   /\
>>
>> AK>                                               ||
>> AK> ..lets try again: I don't find "-m --multioport" _anywhere_
>> AK> in the docs, so, if you _actually_ try '-m --multioport' in
>> AK> your rule set, it _should_ fail, then you'll wanna try
>> AK> '-m --multiport', without your extra "o".  ;-)
>>
>> Oh yes, now i got, i was too sleepy yestorday to understand. Actualy
>> this rule looks like this:
>>
>> iptables -A FORWARD -i eth1 -p udp -m --multiport --dport 23073,23083 -j
>> ACCEPT
>>
>> and after run, shows no error msg. Thats mean it works but it wont
>> helps me to achive this what i want.
>>
>> I repeat my msg here again:
>>
>> In my network, Linux machine connect Local net (eth1) with internet
>> (ppp0). As a default all INCOMING traffic is deny. I made some rules
>> to access SMTP, HTTP etc. but its not important now.
>> It is necessery for nodes from local net to access server that is in
>> Internet. The address of this server is 62.233.202.165 and listen on port
>> 23073 and 23083.
>>
>> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multiport --dport
>> 23073,23083 -j ACCEPT"
>> wont helps and i have received msg in log like this:
>>
>> Apr 30 02:28:41 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0
>> SRC=192.168.1.2 DST=62.233.202.165 LEN=36 TOS=0x00 PREC=0x00 TTL=127
>> ID=23780 PROTO=UDP SPT=1552 DPT=13073 LEN=16
>>

AT>         From that packet it seems that you want to have --dport accept on port 13073
AT>         NOT 23073 ... or perhaps as well as!


ok, so what means a LEN (lenght ???), TOS, PREC ?
Is SPT means source port?
Is DPT means destination port?

Another thing,
In client program i have told that i should use port 23073 or 23083 (
23073 is set as default).
Is taht means that when i use rule "iptables -A FORWARD -i eth1 -p udp
-m --multiport --dport 23073,23083 -j ACCEPT" i make able demand
packets to go out and then server answer from 62.233.202.165:1552(SPT)
to my blocked port 13073 (DPT) ?

But if its like i suspect, shouldent help rule that i set earlyer? :
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


-- 
Best regards,
 mailto:netfilter_user@o2.pl


