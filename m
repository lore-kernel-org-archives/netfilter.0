From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: IP and MAC Address check
Date: Wed, 5 Oct 2005 10:11:30 +0200 (CEST)
Message-ID: <60592.193.173.147.3.1128499890.squirrel@webmail.sterenborg.info>
References: <005d01c5c964$b7ccebe0$580110ac@HO.lippogeneral.com><200510050029.36699.rob0@gmx.co.uk><00cb01c5c970$b6eb9620$580110ac@HO.lippogeneral.com>
	<200510050123.52028.rob0@gmx.co.uk>   
	<00e401c5c978$4ba35120$580110ac@HO.lippogeneral.com>
	<57904.193.173.147.3.1128496418.squirrel@webmail.sterenborg.info>
	<011a01c5c981$b6f1a0e0$580110ac@HO.lippogeneral.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <011a01c5c981$b6f1a0e0$580110ac@HO.lippogeneral.com>
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

On Wed, October 5, 2005 09:52, Winanjaya - PBXSoftwares wrote:

>> ...[rules]...
>> # If the source IP is in 172.16.2.240/29, jump to a user defined
>> chain.
>> $ipt -A INPUT -s 172.16.2.240/29 -j MAC-CHECK
>> ...[other rules]...
>>
>> # User defined chain.
>> # RETURN to built-in chain INPUT if the MAC address matches
>> # Otherwise, DROP the packet
>>
>> $ipt -N MAC-CHECK
>> $ipt -A MAC-CHECK -m mac --mac-source 00:12:95:6d:0a:3e -j RETURN
>> $ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:61:14 -j RETURN
>> $ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:62:29 -j RETURN
>> $ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:63:ba -j RETURN
>> $ipt -A MAC-CHECK -j DROP
>
> I tried it .. but all traffic 172.16.2.240/29 will be dropped
> although it has valid Mac Address.. could you please advise ..what
> should I check?

As /dev/rob0 mentioned : are you sure that the PC's that you want to
check the MAC address from are on the same physical ethernet segment ?
If not then you won't be able to match the MAC address.

You may want to check with this :

$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:6d:0a:3e -j LOG \
  --log-prefix "MAC1: "
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:6d:0a:3e -j RETURN

$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:61:14 -j  LOG \
  --log-prefix "MAC2: "
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:61:14 -j RETURN

$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:62:29 -j LOG \
  --log-prefix "MAC3: "
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:62:29 -j RETURN

$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:63:ba -j  LOG \
  --log-prefix "MAC4: "
$ipt -A MAC-CHECK -m mac --mac-source 00:12:95:15:63:ba -j RETURN

See if you get any logging. If not, the MAC addresses do not match.


Gr,
Rob



