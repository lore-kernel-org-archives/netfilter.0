From: Ben Yerushalmi <beny@pd.verio.net>
Subject: Re: Redirect ports on localhost
Date: Thu, 25 Mar 2004 22:35:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6FF54B22-7EE7-11D8-98D9-000A957E9214@pd.verio.net>
References: <406099AD.2070403@verio.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <406099AD.2070403@verio.net>
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

Here's what I did:

iptables -A OUTPUT -t nat -p udp -o lo -d localhost --dport 53 -j 
REDIRECT --to-ports 5300

Should work for you.
Ben


