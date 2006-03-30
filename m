From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: help me (nfcan: addressed to exclusive sender for this address)
Date: Thu, 30 Mar 2006 07:45:01 +0200
Message-ID: <000201c653bd$16ea0e40$0101000a@sterenborg.info>
References: <20060329231421.0d6d3a59.0x62ash@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060329231421.0d6d3a59.0x62ash@gmail.com>
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

>> $ipt -A [INPUT|FORWARD] -i $IF_LAN -m state --state NEW -s $LAN_NET \
>>   -p tcp --syn -m limit --limit 3/sec -j ACCEPT
> 
> If just ONE host from my $LAN_NET will exceed this limit, then ALL
> hosts in $LAN_NET will not able to start new session... and this is
> bad. I want to limit 3/sec per host, not for all net....

Yes.. :-\
Maybe this post is of help then.
http://www.linux-noob.com/forums/index.php?showtopic=1829


Gr,
Rob


