From: Noman Jamil <zil_pk@yahoo.com>
Subject: ip_nat_h323/h323 module nat problem
Date: Sat, 30 Sep 2006 00:27:25 -0700 (PDT)
Message-ID: <20060930072725.62960.qmail@web50405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hello, am writing the same problem 2nd time at list,
didn't get any reply from anybody yet! Anbody could
plz mind replying ;)

I have been able to compile the kernel 2.6.18 with
h323 support and iptables version 1.3.5, however, I am
still not able to conduct (h323) calls between the
outside  and NAT endpoint.

First, after rebuild of kernel and reboot, i have
loaded  ip_nat_h323 and ip_nat_h343 module. When
placing a call from the NAT endpoint  to a remote
endpoint. The same symptoms occur as before I applied
the patch/module. The  remote user is unable to hear
(recieve voice) from the inside NAT endpoint.  The
remote use can accept the call and recieve everything
fine.

Do you have any answer to this riddle. I hope it is
simple and that I  am missing a "step" somewhere, or
there is something wrong with the connection tracking,
which is not replacing/writing the header when send
information to the NATed endpoint, below is the detail
description of  a call.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

