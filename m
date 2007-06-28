From: "CrackyBlue" <crackyblue@gmail.com>
Subject: Compiling iptables 1.3.8 over kernel 2.6.21 woes
Date: Thu, 28 Jun 2007 10:21:47 +0800
Message-ID: <46831b8b.26d7720a.51fc.ffffd2e3@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-mailer:thread-index:x-mimeole:message-id;
	b=kbACJEQ4ylU7T8hxWjWT/rWXfqjXXirNC8R7F/eaPEP3faQNAUJAe+HJ77TjYV4/hRZn9bPAmD9fieW7AWDvQ6G7MHD2kiejW04wbJRcfLCw6PIT5o+6Bs1v9DWiHmsWkbrdenXGrkPrSm/VJfajfQDUYECLHSftuAth7SuxSC4=
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
 
Im trying to configure iptables 1.3.8 and patches over kernel 2.6.21, all is
well except for patch-o-matic which seems do not patch. Anyway as i breeze
thru the menu for setting up my kernel, ive noticed that i cant see MASQ nor
DNAT nor SNAT modules, does it need to be there? Thanks for any advice..
 
Nats


