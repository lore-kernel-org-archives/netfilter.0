From: "Nicolas Olivier" <nolivier@alphalink.fr>
Subject: Re: ip_conntrack_ftp
Date: Fri, 24 Jun 2005 10:10:16 +0200
Message-ID: <42BBBFE8.4080709@alphalink.fr>
References: <42BBBDE6.9040108@alphalink.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42BBBDE6.9040108@alphalink.fr>
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


Just an update as schema is a total mess.

customer-1  172.16.0.2/30 -------------------  172.16.0.1/30 (nas0) rt-1 (nas1) 10.0.0.2/30 --------------- 10.0.0.1/30 (nas1) rt-2


oustside                  ------------------- 10.10.60.23/24 (eth0) rt-1 (eth1) 10.0.0.5/30 --------------- 10.0.0.6/30 (eth1) rt-2



