From: "SoFy DeNiro" <sofy.guru@gmail.com>
Subject: INPUT and uid-owner
Date: Thu, 13 Sep 2007 15:20:18 +0300
Message-ID: <9ace7c010709130520l249e5952ib39dca1d601cd68c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=v2usWFjK4Yb0a8FUnaHIVQTeglO5MVGQtljugiFYmlg=;
	b=QQ9skJMUqrmf+lYwJwe+qyNoE3BE/BuC0ge2ERLuH9ZxedC4HfVck6Pvob1mlG73+Wbjq+kJl4DpQuyrhDlvjCfJpRYAr4iVqEi9yT/MJevJ26gCbJEFL04+B3aMOUhhLmxgc/5xJ7NGhNn2AFBarBw3Fv3+vU8Y3lG+/ixh71s=
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Is there's anyway to use INPUT chain with uid-owner ?

something like that :

iptables -A INPUT -p tcp -mowner --uid-owner root --dport 80 -j DROP

Thanks,
SoFy.

