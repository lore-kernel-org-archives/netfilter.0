From: Scott MacKay <scottmackay@yahoo.com>
Subject: indev/outdev_name?
Date: Tue, 8 Apr 2003 18:25:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030409012532.14096.qmail@web13908.mail.yahoo.com>
References: <200304081109.42705.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304081109.42705.netfilter@newkirk.us>
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

Sorry if this is more of an ebtables thing, but
probably is relevant to how the 2.5 kernel responds...

When you configure a bridge, is there any way to have
the real interface name in indev_name or outdev_name
for userspace modules?  Seeing a FORWARD packet from
"br0" to "br0" is not helpful...

Also, is there any other solution other than ebtables
to have a bridge send packets to an iptables userspace
module?

-Scott

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

