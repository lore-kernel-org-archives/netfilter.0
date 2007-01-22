From: <bedogniluca-linux@yahoo.it>
Subject: Routing packets via a C program
Date: Mon, 22 Jan 2007 10:05:59 +0100 (CET)
Message-ID: <436881.33948.qm@web26001.mail.ukl.yahoo.com>
Reply-To: bedogniluca-linux@yahoo.it
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

Hi all
        i'm writing down a simple program for routing
the packets manually.
The idea is:
if a packet comes from a specific IP (192.168.0.2) I
set ip->saddr to my ip 
and then accept it. And, if a packets comes from the
outside, i set ip->daddr 
to 192.168.0.2 and then accept it.
I recalculate the checksum and it's correct (i can see
that by printing it out).

The basic problem is that, sniffing packets with
wireshark, i can see the 
packet from 192.168.0.2 to outside, but not mine to
outside.

I also tried with NF_REPEAT and NF_ACCEPT and NF_QUEUE
when calling 
ipq_set_verdict, but nothing changed..

Any hints? RTFM?

Regards




	

	
		
___________________________________ 
Vinci i biglietti per FIFA World Cup in Germania! 
yahoo.it/concorso_messenger

