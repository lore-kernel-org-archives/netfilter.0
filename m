From: andre.correa@pobox.com
Subject: Too many ARP entries and Re: sendto: No buffer space available
Date: Mon, 2 Dec 2002 18:28:36 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14127620470.20021202182836@pobox.com>
References: <571705138.20021202111645@pobox.com>
Reply-To: Andre Docena Correa <andre.docena@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <571705138.20021202111645@pobox.com>
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
To: netfilter@lists.netfilter.org
Cc: andre.correa@pobox.com


Hi, I am writting to answer myself and send a new question to the list.
I've had problems in my NAT/PPPoE box, with traffic stopping suddenly
and then coming back in a few seconds and I've found that my neighbour
table was getting full. When it is full, no new ARP entries can be
created and no new traffic can happen. Now I encreased this values:

echo 512 > /proc/sys/net/ipv4/neigh/default/gc_thresh1
echo 2048 > /proc/sys/net/ipv4/neigh/default/gc_thresh2
echo 4096 > /proc/sys/net/ipv4/neigh/default/gc_thresh3

But  there  is  still a question for me. Looking at my arp table, I
see that there are =~ 150 entries, seconds passing and more entries
coming, 20 seconds after I can have =~1100, it goes on until it reachs
=~2200  entries,  then it goes back to the =~100 and starts over again.

I  have  less  then  50  NAT users. Is it normal to have some many ARP
entries with this variation? Looking the ARP table I see my "Internet"
interface with lots of entries, with internet host IP addresses and my
gateway's NIC MAC address.

Isn't ARP supposed to keep entries just to local network systems?

Is it all normal? And if so, how big can gc_threash[1,2,3] be?

tks in advance.

Andre
andre.correa@pobox.com



On 02/12/02, andre.correa@pobox.com wrote:

acpc> Hi list,

acpc> I  have  a  Linux  2.4.19  box  doing NAT, PPPoE, Traffic Shapping and
acpc> Firewalling.  It  is  a  2xPIII  733MHz with 512Mb RAM. Everything was
acpc> working  just  fine  until 5 or 6 days ago we started having some strange
acpc> behavior.

acpc> Under  moderate  traffic,  15  to  20  NAT users, we find that traffic
acpc> suddenly  stops  for 10 or 15 seconds and then comes back. During this
acpc> periods  I've  figured  out  that  if I ping my interfaces or Internet
acpc> addresses I get:

acpc> sendto: No buffer space available
acpc> ping: sent 64 octets to xxx.xxx.xxx.xxx, ret=-1

acpc> I've  made  lots  of  searchs  in  mailling lists, Internet and in the
acpc> kernel  source  but couldn't work on it.

acpc> Can you guys help me to solve this problem?

acpc> tks in advance for your help and attention.

acpc> Andre
acpc> andre.correa@pobox.com




Andre Correa
andre.docena@pobox.com


