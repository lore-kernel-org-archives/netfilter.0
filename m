From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: DNAT for two external NIC
Date: Fri, 1 Sep 2006 14:32:26 +0800
Message-ID: <054a01c6cd90$641aa3d0$0100a8c0@newlife>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Pascal Hambourg wrote :-

>Hello,
>
>Mikhail a =E9crit :
>>   Everything works fine if I use IP1 address but I was unable to get t=
o the
>> corresponding LAN machine through IP2. Ping requests are also not resp=
onded
>> if they're made to IP2. They do reach eth2 and I can see them using tc=
pdump
>> but then nothing goes out on any NIC. The same goes for TCP/IP request=
s -
>> I've managed to trace them to the nat table PREROUTING chain but they =
could
>> not be found in either INPUT or FORWARD chain of the mangle table. If =
I make
> default route through eth2 - >everything starts working through that NI=
C and
>> stops through eth1.
>
>Maybe you need to disable rp_filter (reverse path filtering) on the
>interface that has not the default route.
>
>sysctl -w net/ipv4/conf/eth2/rp_filter=3D0

Isn't this a bug in rp_filter ? In multipath routing, it's often the syst=
em
will have multiple routing tables. The rp_filter seems to only look at
the main routing table.

Regards.





