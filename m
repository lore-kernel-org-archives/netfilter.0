From: pdcleyn <pdcleyn@uia.ua.ac.be>
Subject: Buffering
Date: Wed, 6 Nov 2002 11:44:10 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33L2.0211061134130.24372-100000@pcinf26.uia.ac.be>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

My question: Does the ip_queue module has a limited buffer for received
packets per stream and if so can I change its size?

Why ...

I want to write an application that buffers incomming data from a network
connection into a circular buffer and reinject these packets onto the
network when I want this to happen.

My first idea was to use the QUEUE target and using a userspace program to
postpone the verdict to a later moment. Its a simple change of the sample
code provided in the libipq manpage, putting each packet into an array
and if the array is filled I flush it by issueing a verdict on every
packet.

As long as the array is nog to big and thus is flushed regularly, all is
fine. However increasing the buffer showed that the QUEUE stoped accepting
packets after a fixed number, depending on the payload of the packets. So
I asume there is a limited buffer per stream in de ip_queue module and
thus my question is can I change its size?

Another question, is this the right appraoch or should I write my own
target?

Thanks,

Peter

-- 
 _______________
/ Peter De Cleyn\
-------------------------------------------------------
| Phone:                +32 (0)3 820.24.18            |
| Fax:                  +32 (0)3 820.24.21            |
| email:                peter.decleyn@uia.ua.ac.be    |
|                                                     |
| University of Antwerp (UIA)                         |
| Dept. Mathematics and Computer Science              |
| PATS Research Group                                 |
| Universiteitsplein 1                                |
| B-2610 Wilrijk                                      |
| Belgium                                             |
-------------------------------------------------------


