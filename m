From: "Domenico Gargano" <d.gargano@planetek.it>
Subject: weird blocked sync packets on win machines
Date: Thu, 11 Nov 2004 15:50:42 +0100
Message-ID: <41938A52.31513.16CC25F@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-description: Mail message body
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

Hi all,
strange things happen on my linuxbox, I've got a firewall box running fedora 2 with 5 net 
adapters. All my private machines (192.168.30.) connect to internet and to my DMZ 
through the linuxbox.
During the day usually happens that my firewall stop forwarding SYN packets, allowing 
instead all other packets (ex. ACK) and all other protocols. This means that I cannot 
establish only new connections (prevoiously opened ones just work fine).
All my eth stop forwarding for 15 minutes, all the new traffic is totally blocked (from/to 
LAN, DMZ, INTERNET).
The really weird thing is that this happen only on windows machines, and during this 
block-time, if I close all IE windows and then I re-open IE, all connections start again to 
work (without waiting 15 minutes), this trick works only if my IE is using squiq proxy 
running on a server located in DMZ.
I've upgraded the kernel from 2.4.22 to all new releases since 2.6.8 but nothing has 
changed, I've changed all net adapters and fine-tuning kernel parameters (like disable 
syn-protect or increase nr. connections and decrease timeout values).
All tests are done with tcpdump.
Can someone please suggest me some way to find a solution? I'm not only looking for 
the right solution, but also some method to study this weird problem.
Thanks


-- 
~~~  Domenico Gargano  [Senior Network Manager]  ~~~
Planetek Italia s.r.l.                        :tel:+39 080 5343750
Via Massaua, 12 - I-70123 BARI     :fax:+39 080 5340280
~~ email:  d.gargano@planetek.it ~~~ www.planetek.it ~~


