From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: ipt_TOS.o vs libipt_TOS.so
Date: Wed, 11 Feb 2004 19:30:04 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040212033004.13772.qmail@web14001.mail.yahoo.com>
References: <20040212023759.97008.qmail@web13426.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040212023759.97008.qmail@web13426.mail.yahoo.com>
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
To: Ahmad Almulhem <feltah@yahoo.com>, netfilter@lists.netfilter.org

--- Ahmad Almulhem <feltah@yahoo.com> wrote:
> I am new to iptables and I am confusing
> ipt_TOS.o and libipt_TOS.so. 
> 
> When you specify the following target 
> 
> iptables -j TOS --set-tos 4
> 
> which one is called? 

  Every iptables match/target has a kernel module and
a user space shared library. The libipt_*.so are the
user space shared libraries while the ipt_*.o (now
ipt_*.ko) are the kernel modules. Both of them are
required for every match/target.

  Hope this helps.

=====
Regards,
Kiran Kumar Immidi

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html

