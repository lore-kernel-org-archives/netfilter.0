From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Is it possible to sync ip_conntrack between 2 hosts?
Date: Sat, 3 May 2003 11:41:37 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030503034137.GC1239@floyd>
References: <1051912895.26015.49.camel@martin.etecom.com>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1051912895.26015.49.camel@martin.etecom.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 02, 2003 at 03:01:35PM -0700, Zack Lawson spoke thusly:
>I am trying to setup up a failover firewall using heartbeat. Everything
>seems to work just fine except for the fact that the state of existing
>connections is lost when the running firewall is stopped.

(snip)

Its planned for the iptables2 release. Check the archives, Harald has
mentioned it before.

