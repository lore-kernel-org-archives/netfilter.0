From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: Help with a firewall script
Date: Sat, 24 Dec 2005 19:11:08 -0500
Message-ID: <1135469468.2584.12.camel@localhost>
References: <004b01c608d9$7991c6c0$6f64a8c0@langherd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004b01c608d9$7991c6c0$6f64a8c0@langherd.com>
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
To: "John P. Lang" <john@langherd.com>
Cc: netfilter@lists.netfilter.org

The first rule changes the source address so the packet can traverse the
internet. The second rule is allowing the outbound packet but you will
need a rule to allow the reply packets such as:

iptables -I FORWARD 1 -m state --state ESTABLISHED,RELATED -j ACCEPT

You can find an excellent tutorial at
http://iptables-tutorial.frozentux.net
There are also some slightly dated training slide shows in the training
section of the ISCS network security management project web site at
http://iscs.sourceforge.net

Hope it helps - John

On Sat, 2005-12-24 at 14:29 -0800, John P. Lang wrote:
> John,
> 
> This is exactly where my confusion lies... I thought that
> 
> > $IPT --table nat --append POSTROUTING --out-interface $EXTNIC -j
> MASQUERADE
> > 
> > $IPT --append FORWARD --in-interface $INTNIC -j ACCEPT
> 
> Would basically allow all of the traffic to go through.
> Can you point me to a proper tutorial or example on how to properly do this?
> 
> Thanks,
> John
> 
> > 
> After a very quick look, it appears that you are allowing outbound
> traffic from the internal NIC but where are you allowing the reply
> packets? Do you have a RELATED,ESTABLISHED rule anywhere? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


