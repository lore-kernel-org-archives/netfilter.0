From: Constantine Filin <constfilin@yahoo.com>
Subject: Matching altered packets in NAT table...
Date: Sun, 20 Aug 2006 22:56:34 -0700 (PDT)
Message-ID: <20060821055634.13620.qmail@web30602.mail.mud.yahoo.com>
Reply-To: Constantine Filin <constfilin@yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear List:
 
I am trying to solve the problem described at http://lists.netfilter.org/pipermail/netfilter/2006-August/066491.html
(How do I make NAT table work reliably?) and for this I'd like to make sure that I understand iptables documentation
correctly. 
 
2 simple questions:
 
a) If I have a rule in PREROUTING NAT table

-A PREROUTING -s 204.147.182.21 -d 204.147.182.200 -p udp -m udp --sport 8000 --dport 23330 -j DNAT --to-destination 207.5.64.156:25590 

where 204.147.182.200 is the IP address of my host and 204.147.182.21 with 207.5.64.156 are two other hosts
I am communicating with, then in the POSTROUTING table, should I match this packet by its *original* destination address
or by its *new* (altered) destination address. In other words - in POSTROUTING table do I write 

-A POSTROUTING -d 204.147.182.200 -p udp -m udp --dport 23330 -j SNAT --to-source 204.147.182.200:21226 
(matching by the original destination) or 
-A POSTROUTING -d 207.5.64.156 -p udp -m udp --dport 25590 -j SNAT --to-source 204.147.182.200:21226 
(matching by the altered destination)
 
???
 
b) If I setup iptables so that all UDP packets coming from 204.147.182.21:8000 to my 204.147.182.200:23330 are redirected to 
    207.5.64.156:25590 from my 204.147.182.200:21226), then how do these packets register in the conntrack. I can see 2 options:

    204.147.182.21:8000 <=> 204.147.182.200:23330
    204.147.182.21:8000 <=> 204.147.182.200:21226
 
    Or are there going to be 2 separate conntrack entries?
 
???
 
Thank you for your insight
 
Constantine

