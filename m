From: Ben Yerushalmi <beny@pd.verio.net>
Subject: Re: Redirect ports on localhost
Date: Thu, 25 Mar 2004 00:34:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CF55D90F-7E2E-11D8-A402-000A957E9214@pd.verio.net>
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

Looks like changing the OUTPUT chain did actually work in redirecting 
localhost traffic. On the Linux 2.4 kernel you will need to enable the 
"NF_NAT_LOCAL" kernel option.

Thanks everyone for their help.

Ben


