From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Preventing port scanning
Date: Wed, 7 Apr 2004 20:57:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040407185754.596353C97@sterenborg.info>
References: <000001c41ccc$1eae1dd0$0464a8c0@stu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c41ccc$1eae1dd0$0464a8c0@stu>
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

> Is it possible to prevent people from port scanning my 
> firewall to see whats open?

You mean : "iptables -P INPUT DROP" ?


Gr,
Rob


