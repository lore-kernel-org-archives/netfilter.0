From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: State NEW and --syn flag
Date: Tue, 20 Jul 2004 11:15:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <TBEXEDU01kJSFsxf4yp000000d3@smtp.maurickcollege.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: 'iptables' <netfilter@lists.netfilter.org>

Hi all,

When writing a rule, if one doesn't specify a state, state NEW is
assumed, right ?

If the first packet of a connection arrives, it has state NEW and
subsequent packets are ESTABLISHED or RELATED. The first packet also has
the --syn flag set so new packets could also be identified by --syn.

If checking for state NEW, is there any reason to also check if the
--syn flag is set or is it enough to just rely on state NEW ?


Gr,
Rob



