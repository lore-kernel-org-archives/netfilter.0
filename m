From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: netfilter hangups
Date: Wed, 12 Mar 2003 09:12:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C39@hslex01.hslbz.local>
References: <3019863CF306D211BA4500A0CC30812DC67914@exchange.cyberwolf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3019863CF306D211BA4500A0CC30812DC67914@exchange.cyberwolf.com>
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
To: netfilter@lists.netfilter.org

> Could the way i am restarting it cause it to refuse to honor 
> new rules w/o rebooting?

<snip>

> > [root@iptables1 root]# /etc/sysconfig/iptables condrestart
> > iptables: Chain already exists
> > iptables: Chain already exists
> > iptables: Chain already exists
> > iptables: Chain already exists
> > iptables: Chain already exists

Yes.

If the script doesn't delete the user-defined chains first and then
tries to create new ones with the same name you get this error.


Rob


