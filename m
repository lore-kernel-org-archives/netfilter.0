From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: IP and MAC Address check
Date: Wed, 5 Oct 2005 09:13:38 +0200 (CEST)
Message-ID: <57904.193.173.147.3.1128496418.squirrel@webmail.sterenborg.info>
References: <005d01c5c964$b7ccebe0$580110ac@HO.lippogeneral.com><200510050029.36699.rob0@gmx.co.uk><00cb01c5c970$b6eb9620$580110ac@HO.lippogeneral.com>
	<200510050123.52028.rob0@gmx.co.uk>
	<00e401c5c978$4ba35120$580110ac@HO.lippogeneral.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00e401c5c978$4ba35120$580110ac@HO.lippogeneral.com>
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
To: Winanjaya - PBXSoftwares <winanjaya@pbxsoftwares.com>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

On Wed, October 5, 2005 08:44, Winanjaya - PBXSoftwares wrote:
...
>> > > Ah, one other comment: this might be better structured using a
>> > > user-defined chain.
>>
>> (Hold that thought ...)
...
>> Think about this. Look at the first rule:
>> >  -A RH-Lokkit-0-50-INPUT -m mac -s 172.16.2.240/29 ! --mac-source
>> > 00:12:95:6d:0a:3e -j DROP
>>
>> If the source IP is in 172.16.2.240/29 and the MAC address is *not*
>> 00:12:95:6d:0a:3e, drop the packet. Your second and subsequent MAC
>> rules will never be used, because those packets are already dropped.
>>
>> That's why I'd use another chain for this. Put an ACCEPT rule in the
>> calling chain after the jump to your new chain. Use -j RETURN rules
>> for your permitted MAC addresses, and a -j DROP rule at the end of
>> your new chain.
>>
>> I hope you do understand about MAC filtering: it only works when
>> your packets originated on the same physical segment. Anything from
>> outside your physical segment will come to you with the MAC address
>> of your upstream router.

> I am really sorry that I am not sure that I already understood what
> you mean exactly.. could you please give me a simple example for
> this? ..
> thanks a lot in advance

...[rules]...
# If the source IP is in 172.16.2.240/29, jump to a user defined chain.
$ipt -A INPUT -s 172.16.2.240/29 -j MAC-CHECK
...[other rules]...

# User defined chain.
# RETURN to built-in chain INPUT if the MAC address matches
# Otherwise, DROP the packet

$ipt -N MAC-CHECK
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:6d:0a:3e -j RETURN
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:61:14 -j RETURN
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:62:29 -j RETURN
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:63:ba -j RETURN
$ipt -A MAC-CHECK -j DROP


Gr,
Rob



