From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Synfloods - SNAT slow down
Date: Fri, 23 Apr 2004 16:37:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005f01c42940$79a18210$1202a8c0@admin>
References: <005201c428d1$a2ab2ea0$2800a8c0@jupiter> <200404230801.57077.lists@edeca.net> <007601c42938$e74199c0$2800a8c0@jupiter>
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

> I have two thousand hosts and two thousand forward rules :(

With so many hosts/rules you should be able to match subnets instead of
each host separately, reducing the number of rules greatly which in turn
improves Netfilter performance. Or do you have a special reason to do
this ?


Gr,
Rob


