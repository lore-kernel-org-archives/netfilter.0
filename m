From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: iptables on Satellite receive only linux PC
Date: Wed, 28 Jul 2004 09:37:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4107BA41.4060409@pbl.ca>
References: <410736B8.D9130BBF@neduet.edu.pk> <1090995073.2141.35.camel@anduril.intranet.cartel-securite.net> <41074F24.2BF980C3@neduet.edu.pk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41074F24.2BF980C3@neduet.edu.pk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

yunus wrote:
> When I change the line below to accept everything works fine.
> 
> $IPTABLES -P FORWARD DROP    to  $IPTABLES -P FORWARD ACCEPT

Of course it works, because you just deactivated your firewall. 
Anything goes through it (all your rules in FORWARD chain have ACCEPT 
target, and than you changed default policy to ACCEPT: everything is 
accepted).

Also, it seems that you have (incorrect) assumption that packet will go 
through both INPUT and FORWARD chains (because you are catching "bad" 
packets only in INPUT chain).  Packet will go either through INPUT (if 
it is destined for local machine) or through FORWARD (if it is to be 
routed/forwarded to another machine).  It will never go through both.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

