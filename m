From: "Jeffrey J. Karrels" <netfilter@mail.idss.ida.org>
Subject: H323
Date: Mon, 5 Apr 2004 11:10:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LHEPKNIHJENOALDCGKEGOEHJCAAA.netfilter@mail.idss.ida.org>
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
To: netfilter@lists.netfilter.org

Hello,

I am trying to get Netmeeting/Remote Desktop Sharing to work.  I have
2.4.20-30.9 kernel and am running iptables-1.2.9.  I have patched the kernel
with the only the H323 patch.  I opened up the 1720 and 1503 ports.  I get
the following message in my syslog when I try to open up an connection from
the outside going in:

H.323_NAT: partial packet 0/6 in 0/0

I have seen this in the mailing list a couple of times, I was wondering if
anyone knew anything about it? Any suggestions?  Am I missing something?

Thank you
-Jeff


