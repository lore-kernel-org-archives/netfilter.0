From: babula allu <allubabula@yahoo.com>
Subject: How to fill a ipt_entry structure to add a rule using iptc_append_entry()
Date: Tue, 22 Jun 2004 04:54:22 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040622115422.45768.qmail@web20027.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,


I am trying to add a simple rule to INPUT chain using
iptc_append_entry  but it fails.It says invalid
argument.

 I also tried sending the same ipt_entry structure
which was returned by the iptc_first_rule API.In this
case iptc_append _entry doesn't return an error but
iptables -L doesn't display the rule in the list also.

If somebody knows about the cause and solution please
help me.


thanks
Babula


		
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail

