From: "zeus" <zeus@ford-prefect.net>
Subject: Re: nmap
Date: Tue, 22 Oct 2002 22:35:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210230535.g9N5Z33h029321@ford-prefect.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> OK but if I set the policy OUTPUT at DROP which ports/prot I have to set to
> ACCEPT?  This's my problem.

you can use the ownercmd patch in p-o-m for this:

iptables -A OUTPUT -m owner --cmd-owner nmap -j ACCEPT

-Bob

