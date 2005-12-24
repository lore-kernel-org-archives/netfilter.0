From: "John P. Lang" <john@langherd.com>
Subject: RE: Help with a firewall script
Date: Sat, 24 Dec 2005 14:29:16 -0800
Message-ID: <004b01c608d9$7991c6c0$6f64a8c0@langherd.com>
References: <1135453076.2584.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1135453076.2584.7.camel@localhost>
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
To: "'John A. Sullivan III'" <jsullivan@opensourcedevel.com>
Cc: netfilter@lists.netfilter.org



John,

This is exactly where my confusion lies... I thought that

> $IPT --table nat --append POSTROUTING --out-interface $EXTNIC -j
MASQUERADE
> 
> $IPT --append FORWARD --in-interface $INTNIC -j ACCEPT

Would basically allow all of the traffic to go through.
Can you point me to a proper tutorial or example on how to properly do this?

Thanks,
John

> 
After a very quick look, it appears that you are allowing outbound
traffic from the internal NIC but where are you allowing the reply
packets? Do you have a RELATED,ESTABLISHED rule anywhere? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


