From: "Tony Thompson" <tony.thompson@stone-ware.com>
Subject: Do I need to write a module?
Date: Mon, 23 Jun 2003 13:43:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sef70417.087@mail.stone-ware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I am investigating an option to use netfilter to allow/deny traffic from
the local subnet based on rules/accounting information that is in
another (Java based) system.  I am new to netfilter so, I can someone
offer some suggestions:

1. Is netfilter the right place to hook or should I look at a firewall
that may provide some higher level hooks for authentication and
accounting?

2. If I should hook into netfilter, is it a good idea to call into a
JVM from a netfilter module?

3. I am not sure what kind of control I have when using the userspace
driver but, should I use that in this situation?  Can I use that
directly from Java so I wouldn't have the hassel of calling into a JVM
from a native process?

If anyone can offer any other suggestions or examples, that would be
appreciated.

Thanks.
Tony

