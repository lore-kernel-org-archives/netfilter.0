From: ip tables <iptables_help@yahoo.com>
Subject: postrouting and dmz
Date: Tue, 24 Feb 2004 22:58:03 -0800 (PST)
Sender: redhat-list-admin@redhat.com
Message-ID: <20040225065803.40555.qmail@web20730.mail.yahoo.com>
Reply-To: redhat-list@redhat.com
Mime-Version: 1.0
Return-path: <redhat-list-admin@redhat.com>
Errors-To: redhat-list-admin@redhat.com
List-Help: <mailto:redhat-list-request@redhat.com?subject=help>
List-Post: <mailto:redhat-list@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/redhat-list>,
	<mailto:redhat-list-request@redhat.com?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/redhat-list>,
	<mailto:redhat-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/redhat-list/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: red hat <redhat-list@redhat.com>, ip tables <netfilter@lists.netfilter.org>

Hello,

I use iptables 1.2.7a on RH 9.0 when i enable 
iptables -t nat --policy PREROUTING DROP
it stops my connecting to the services offerd @ the
natted dmz. Also nmap shows the ports opened when i do
a "connect" scan. I have no user defined chanins. Any
idea?

Thanks and regards

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools


-- 
redhat-list mailing list
unsubscribe mailto:redhat-list-request@redhat.com?subject=unsubscribe
https://www.redhat.com/mailman/listinfo/redhat-list
