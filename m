From: Scott MacKay <scottmackay@yahoo.com>
Subject: ip_queue, userspace module, ipq_packet_msg_t field 'hook'.  Any purpose?
Date: Thu, 29 May 2003 04:58:08 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030529115808.57818.qmail@web13908.mail.yahoo.com>
References: <20030529104713.GL33081@justpickone.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030529104713.GL33081@justpickone.org>
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

Hello.
I am working with a userspace module, registered for
the QUEUE iptables target.  When getting packets from
the kernel, it receives a ipt_packet_msg_t structure. 
One of the fields it gets is an int 'hook'.  Does this
field serve any useful purpose?  Does it describe in
any way the  table which the QUEUE was invoked from?

-Scott

__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com

