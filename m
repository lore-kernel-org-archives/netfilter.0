From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Flag SYN not necessarily state NEW?
Date: Sat, 15 Jun 2002 12:35:35 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org



>>On Wed, 8 May 2002, Ing. Christian Ogris wrote:
>> I connect from Box A via SSH to Box B, where the firewall runs, and i
>>get the state "NEW" on the first packet.
>> Then - the first connection is still established - i connect AGAIN from
>>Box A to Box B and do NOT get the state "NEW" anymore. (So obviously
>> it's already accepted by the ESTABLISHED,RELATED -j ACCEPT rule).
>> Is this behavior correct?

>No. But so far nobody has reported such an ill-behaviour. I assume
>something is wrong in your setup/logging.
>
>Regards,
>Jozsef



I have tested this as im running SSH ans as you can see hear in the print
out of my packets that
i dont even need a Established Related Rule for SSH from the Internet or
Internaly , this is handled
by IP_conntrack moddule and so on .. :-) .


(Notice My SSH Box has its own IP on the Firewall (yet i have still
restricted access to the box as only SSH)

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

51 38424 ACCEPT     all  --  *      eth0    172.16.0.22
172.16.0.0/16

/> netstat -C

Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 yes-dave.dynamicacc:ssh 172.16.0.123:2867
ESTABLISHED
Active UNIX domain sockets (w/o servers)

&
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 yes-dave.dynamicacc:ssh 172.16.0.123:2872
ESTABLISHED
tcp        0      0 yes-dave.dynamicacc:ssh 172.16.0.123:2871
ESTABLISHED
tcp        0      0 yes-dave.dynamicacc:ssh 172.16.0.123:2867
ESTABLISHED
Active UNIX domain sockets (w/o servers)
Proto RefCnt Flags       Type       State         I-Node Path



when i connect the first time (have not logged on yet) my SSH server says
the connecttion is already
ESTABLISHED and not NEW , and thats the same for evey connection after this
. The reason behind this is
SSH needs to establish a ESTABLISHED connection to the server before any
data is correctly Encrypted .. :D



