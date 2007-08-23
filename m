From: "CrackyBlue" <crackyblue@gmail.com>
Subject: about ipt_string
Date: Thu, 23 Aug 2007 09:19:43 +0800
Message-ID: <46cce0f3.22bd720a.5b5c.ffffc703@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-mailer:thread-index:x-mimeole:message-id;
	b=YibZCgrJm8sKuyqTwhYZ1uHYT6zdc87gRg90tGysxnMdWTprifUm9Cktd8xzKlOKafQNctVV9DGm8Df/RlSG1UoSD+SmxZnLIMR0FGBbrnu1A7yWgTFXhn/7nt21PACjMlABtO8SRAYC1th4/tmbhBgt+0FkcDW5dxxObpzRI2o=
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
To: netfilter@lists.netfilter.org

Hi,

I am just wondering why this script don't block 
 
iptables -A INPUT -p tcp -m string --string 'bittorent' --algo kmp -d 0/0
--dport 80 -j REJECT

I have iptables 1.3.8 and 2.6.17 kernel and ipt_string is already loaded


Thanks


