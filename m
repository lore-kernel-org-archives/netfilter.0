From: Jochen Radmacher <jradmacher@gmx.de>
Subject: Re: Iptables - Port forwarding - extremely baffled.
Date: Fri, 02 May 2003 14:41:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB2677D.9070104@gmx.de>
References: <20030430193307.64412.qmail@web13509.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030430193307.64412.qmail@web13509.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

A good Idea for all such Problems is to do a 
 grep "dport=22 " /proc/net/ip_conntrack
   and a maybe
 grep "dport=22022 " /proc/net/ip_conntrack
to find out  if the connection is at least in the list of tracked 
connections.

Greets
 Jochen Radmacher



