From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: transparent bridge troubles?
Date: Fri, 7 Jan 2005 12:24:04 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679642@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: mdpeters <michael.peters@lazarusalliance.com>, netfilter@lists.netfilter.org


> I am queuing all of the packets to a userspace daemon for
> Snort-inline to process. If Snort is the problem then could you
> advise me on the iptables to pass everything through the transparent
> bridge to eliminate it from the equation?  =20

Write a log rule before and after the QUEUE rules.

You'll probably find that they enter the QUEUE targets section and never
leave. The QUEUE target will never return a packet to the system unless
the userspace program has processed the packet, so it snort-inline is
turned off or broken, none of the matched packets will pass through
QUEUE.

The problem is that there's no graceful timeout period in which QUEUE
assumes that the userspace process is dead. There should be a flag that
says the packet will 'continue'/'drop'/'accept' based on the userspace
program's timeout.


