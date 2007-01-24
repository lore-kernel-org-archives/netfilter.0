From: "zze-FREDI POIROT N ext RD-MAPS-LAN" <npoirot.ext@orange-ftgroup.com>
Subject: Pid owner module
Date: Wed, 24 Jan 2007 10:37:55 +0100
Message-ID: <9772C290CD0BDF4B91356C9102BA886A0567BA9D@ftrdmel1.rd.francetelecom.fr>
References: <9772C290CD0BDF4B91356C9102BA886A033DB22B@ftrdmel1.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <9772C290CD0BDF4B91356C9102BA886A033DB22B@ftrdmel1.rd.francetelecom.fr>
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

Hello !
I'am trying to filter packet send from my PC according to pid,
(IPT_OWNER_PID) in order to log and exclude packets from a given app.

So I had a look to the iptables man page and tried to use the
--pid-owner feature with a rule like :
iptables -A OUTPUT -m owner --uid-owner $PID -j LOG --log-level 5
--log-prefix "[MyProcess]"


Unfortunately, on my kernel (see version bellow), this commands doesn't
work :
iptables: Unknown error 4294967295
And the trace in /var/log/messages :
Jan 24 10:25:47 localhost kernel: ipt_owner: pid, sid and command
matching not supported anymore

This functionnality seems to be not supported anymore, whereas on an
older kernel (2.6.12), it works perfectly...
Here is the kernel version : Linux l-dhcp-10337-2 2.6.17-5mdv #1 SMP Wed
Sep 13 14:32:31 EDT 2006 i686 Genuine Intel(R) CPU           T2300  @
1.66GHz GNU/Linux

A quick look in the source show me that it is not implemented anymore...

So, finally, here are my questions :=20
1. is there still a functionality like this (PID filte) in iptables ? Is
there a replacement (another tool...) 2. How to activate (if possible)
the pid owner module ?
3. Since which kernel version has this module been disabled ?


Thanks for your help !
Nicolas

