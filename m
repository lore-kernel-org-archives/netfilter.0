From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: VPN?
Date: Fri, 13 Aug 2004 11:47:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040813154735.GA18812@tranquility.scriptkitchen.com>
References: <D5C9032B2B09C64EA2409D6214E91AC905127E@asimail2.alphanumeric.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC905127E@asimail2.alphanumeric.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Fri, Aug 13, 2004 at 11:16:58AM -0400, Jason Opperisano wrote:
> 
> are you NAT-ing the connections from 192.168.0.0/24 to the PPTP server?  according to "-A POSTROUTING -s 192.168.0.0/255.255.0.0 -j MASQUERADE" in your posted rules, you are.

Yes I am.

> you need the pptp-conntrack-nat from POM for this to work.

# modprobe pptp-conntrack-nat
FATAL: Module pptp-conntrack-nat not found.

Do I need to recompile the kernel for that?
I use mandrake 10.0, 2.6.3-7mdksmp.

With warm regards,
-Payal

