From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: iptables does not support chkconfig!
Date: Mon, 23 Dec 2002 08:46:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKKELILLAA.rsterenborg@xs4all.nl>
References: <20021223043939.54762.qmail@web40612.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021223043939.54762.qmail@web40612.mail.yahoo.com>
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

> I tryed using 
> "chkconfig levels 23456 iptables on" but get this 
> service iptables does not support chkconfig
> 

Put this in the top of your script (including the #):
#chkconfig: 2345 <start-prio> <stop-prio>

Then use this :
chkconfig --level 2345 iptables on


Rob


