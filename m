From: Scott MacKay <scottmackay@yahoo.com>
Subject: Fecora kernel + conntrack + QUEUE mangle good?
Date: Thu, 24 Jun 2004 03:41:28 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040624104128.86529.qmail@web13904.mail.yahoo.com>
References: <40DA3549.9000109@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40DA3549.9000109@linuxmail.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

Hello,
   I have a userspace app which does some mangling on
packets in the userspace QUEUE target under 2.4.x.  It
relies on conntrack being loaded to defragment packets
(it is in the POSTROUTING,mangle table).  Works dandy
under 2.4.x.
   I loaded up a Fedora RC2 machine (2.6.5 maybe?) to
see how well it would work and for most packets it was
fine.  I was losing large packets, however (ie: 24K
UDP packets).  After some investigation and putting
some checksum code in place, it looks like the
packet's contents were getting corrupted by comparing
checksums on the sender QUEUE and the receiver's QUEUE
userspace apps.  I am still checking on when this
occurs, but when using 24K, the last bits of the
defragmented packet were all '0's instead of the
original value.  I believe that if I do not alter the
packet, that there are no issues (need to confirm
today).  I will be continuing tests today, but are
there any known issues when altering large packets in
userspace under the 2.6 kernel?  Thanks in advance!!

-Scott


		
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail

