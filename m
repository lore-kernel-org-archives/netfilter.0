From: forum@users.pc9.org
Subject: Re: Redirect ports on localhost
Date: Fri, 26 Mar 2004 00:07:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <jbm.20040326000730.287ca32c@alkaid.pc9>
References: <406099AD.2070403@verio.net>
  <6FF54B22-7EE7-11D8-98D9-000A957E9214@pd.verio.net>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6FF54B22-7EE7-11D8-98D9-000A957E9214@pd.verio.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> Here's what I did:
> 
> iptables -A OUTPUT -t nat -p udp -o lo -d localhost --dport 53 -j
> REDIRECT --to-ports 5300
> 
> Should work for you.

Thanks, works for me too!

-- 
forum@users.pc9.org



