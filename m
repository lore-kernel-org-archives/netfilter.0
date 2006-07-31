From: Camus Moire <cm@afm-koeln.de>
Subject: Bridge: Packets goes to the wrong interface #?,
Date: Mon, 31 Jul 2006 11:07:18 +0200
Message-ID: <20b33315bb3f415f27d22ce8686ba1a9@afm-koeln.de>
Mime-Version: 1.0 (Apple Message framework v624)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

	
Hello all together, in the hope that some one could help me here.


> Moire wrote:
>
>> Its an issue where primarily all connections works
>> but sporadically some packets gets rejected.
>>
>> How can i track this down ? Is there a connection
>> count that gets exceeded ?
>
> Look carefully at the log messages -- are the packets entering your
> firewall via the wrong interface?

Hello, after invest a weekend now some details. Well, my setup is as
follows:
Outgoing traffic goes over a bridge either to my dmz or into the  
internet.

These sporadically rejected packets are those that try to leave my
bridge over the wrong interface of the bridge (br0:eth1 instead 
br0:eth2)
They should go into my webserver in the dmz on br0:eth2.

The involved daemon try to access every 8 minutes (service 
availability) -
but over a day at least 5 packets gets rejected. These happens more
in the time window where no one is at the office.

REJECT:IN=eth0 OUT=br0 PHYSOUT=eth1 SRC="$RFC1918IP"
DST="$PUBLICIP " LEN=60 TOS=0x08 PREC=0x00 TTL=63
ID=18613 DF PROTO=TCP SPT=1400 DPT=80

Normal access into the DMZ works. My arp table shows my webserver on
interface br0 and brctl shows

bridge name	STP enabled	interfaces
br0			no                       eth1
                                                         eth2

brctl showmacs br0 (macs are Xed)

port no	mac addr		is local?	ageing timer
    1	00:xxxxxxxxxxxx	yes		   0.00
    2	00:xxxxxxxxxxxx	no		    45.22     <<<< Webserver
    2	00:xxxxxxxxxxxx	yes		   0.00
    1	00:xxxxxxxxxxxx	no		   0.19

it looks like an ageing time out, where the macs gets deleted. ?!
Normal arp reply should work cause the webserver is up and running,
Is my problem exactly here ?

And there is another warning that i got today my first time. Not sure if
it has something to do with this issue.

1 Time(s): Dead loop on virtual device br0, fix it urgently!

How to interpret this warning ?   I appreciate any help.

Thanks in advance

C. Moire


