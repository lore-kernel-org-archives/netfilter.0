From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables don't block traffic
Date: Thu, 22 Apr 2004 19:13:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040422171324.E8620475A@sterenborg.info>
References: <4087FAC9.7000300@riafinancial.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4087FAC9.7000300@riafinancial.com>
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

> OK, I saw the problem. The default for FORWARD chain is 
> another chain called block and its rules don't block this traffic.

Well, ehm, not really.
The policy DROP for the chain means that all traffic that doesn't get
ACCEPTed, REJECTed (or whatever) by one of your rules is DROPped.

Do you have another rule in the chain the ACCEPT's this traffic, before it
reaches your DROP rule ?
Because then the packets are accepted before the ever reach the DROP chain.


Gr,
Rob


