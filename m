From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 14:14:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031030160409.CB6171B9B8@smtp.ttp.nl>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57905@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57905@OST_EXCH_USR5>
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
To: 'iptables mailing list' <netfilter@lists.netfilter.org>

> Just my 0.02, if it's worth that much considering I cant even 
> get DNS lookups from my fw working.....

You have probably set policy to DROP for the OUTPUT chain.
iptables -A OUTPUT -p udp --dport 53 [-d ip_dns] -j ACCEPT
Some would say to also do this for the tcp proto, but this should work.


Gr,
Rob


