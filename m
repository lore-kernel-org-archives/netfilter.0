From: Scott MacKay <scottmackay@yahoo.com>
Subject: iptables 1.2.8, mangle-recomputes, userspace?
Date: Wed, 16 Apr 2003 05:06:53 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030416120653.27839.qmail@web13907.mail.yahoo.com>
References: <01a401c302d0$2abbcdf0$a828a8c0@qualitau.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01a401c302d0$2abbcdf0$a828a8c0@qualitau.com>
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
To: netfilter@lists.netfilter.org

Hello, poking around at the website I see the 1.2.8 is
out.  In the 'history'
(http://www.iptables.org/downloads.html#cvs) it
appears there is a patch-o-matic entry between 1.2.7a
and 1.2.8.  To use 1.2.8, do I need to do anything
special?  I currently have the 2.4.20 w/ebtables
patches.

Also, when mangling the contents of a packet
(including payload size), is there anything special
you need to do aside from recomputing IP and TCP/UDP
checksums?

Lastly, are there any good references for userspace
apps?  There is a ton for the netfilter, but was
looking for more in the way of userspace concepts &
activities.  Thanks!

-Scott



__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com

