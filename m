From: "Michael Frank" <mhf@linuxmail.org>
Subject: Re: Possible to block ports by user group?
Date: Tue, 06 Jul 2004 00:35:42 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsaoa1s2d4evsfm@smtp.pacific.net.th>
References: <opsal65hoe4evsfm@smtp.pacific.net.th> <1088953144.11637.57.camel@anduril.intranet.cartel-securite.net> <opsande9km4evsfm@smtp.pacific.net.th> <200407051034.16368.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407051034.16368.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

On Mon, 5 Jul 2004 10:34:16 -0400, Alistair Tonner <Alistair@nerdnet.ca> =
wrote:

> On July 5, 2004 12:29 am, Michael Frank wrote:
>> On Sun, 04 Jul 2004 16:59:04 +0200, Cedric Blancher
> <blancher@cartel-securite.fr> wrote:
>> > Le dim 04/07/2004 =E0 15:16, Michael Frank a =E9crit :
>> >> Would like to block ports depending on the group in use
>> >
>> > See owner match :
>> >
>> > cbr@anduril:~$ iptables -m owner --help
>> > iptables v1.2.11
>> > [...]
>> > OWNER match v1.2.11 options:
>> > [!] --uid-owner userid     Match local uid
>> > [!] --gid-owner groupid    Match local gid
>> > [!] --pid-owner processid  Match local pid
>> > [!] --sid-owner sessionid  Match local sid
>> > [!] --cmd-owner name       Match local command name
>> >
>> > --gid-owner seems to satisfy your needs.
>>
>> Thank you for the pointer. This works very well.
>>
>> I think there is a problem though wrt ICMP requests. The following
>> rule allows _everyone_ to ping, but I would expect only root to be abl=
e to.
>>
>> ACCEPT     all  --  anywhere             anywhere           OWNER UID =
match
>> root
>>
>> This rule has no effect on ICMP i am mhf and can't ping.
>>
>> ACCEPT     all  --  anywhere             anywhere           OWNER UID =
match
>> mhf
>>
>> This is with Vanilla kernel 2.4.24. Any know issue here?
>>
>
> 	I would suggest that in all likelyhood your ping/traceroute are setuid=
 root.
> 	*grin*
>

ping must be root or suid root, the packet count of  "UID match root"
increases with ping and nmap does work non root.

Thank you :)

	Michael








