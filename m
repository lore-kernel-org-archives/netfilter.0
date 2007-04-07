From: "Patrick Ale" <patrick.ale@gmail.com>
Subject: WARNING: "ipt_unregister_match"
Date: Sat, 7 Apr 2007 18:55:53 +0200
Message-ID: <8d158e1f0704070955x2bb50060ueb8d2c0b91acba00@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=cN5GUf3lcHXEwItKEcZodTy8O5TsE+rHYqx/pP6Zm2lIHgc7lH0WTfhSlywc1GN4wwiyoeVSGVtqZ12U20M9QEtDwputDqL4XpE468/8zlkQnEyFvLHr0RY0RNpgtkUqMdHC2WfEUE3nQl0Gzj41G6WKuMc+bwtc6UH20mOTkKM=
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

Hello! :)


I am getting the following error when using linux-2.6.21 or any resent git tree:
WARNING: "ipt_unregister_match" [net/ipv4/netfilter/ipt_connlimit.ko] undefined!


I searched google a bit, and I see I am not the only one.
Only problem is I can't really find someone smashing the hammer as of
how I can fix this error :)


Any help would be appriciated!


Thanks,


Patrick

