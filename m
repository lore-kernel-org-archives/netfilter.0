From: "Yang" <aybtdym02@sneakemail.com>
Subject: getsockopt failed strangely: Invalid argument
Date: Fri, 15 Jun 2007 16:01:07 -0700
Message-ID: <18962-92451@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=ttLGMIpK4e0uyfOosFlFeXoT6KxpDAz44Y8h0QaRhRMH18P5Cx76zVPNvITyt0if+AB2eFyvR47qc/ELW+nbpnj28t+U9EOUnM1f5jl1np9eflIHpkOYv9+wrwSEkWbAXBDGyHyMXwsfMEMSYdpR9xhKBxr2LboklzEkG0rUWFs=
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Can anybody explain what's going on? My (otherwise normal-behaving)
workstation spits out the following:

$ uname -a
Linux myhostname 2.6.18.5-gg10-mixed64-32 #1 SMP Tue May 8 22:29:42
PDT 2007 x86_64 GNU/Linux

$ sudo iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
getsockopt failed strangely: Invalid argument
ACCEPT     tcp  --  anywhere             anywhere

Please let me know what other information, if any, would be useful.

Thanks in advance,

Yang

