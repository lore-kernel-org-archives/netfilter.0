From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Invalid friggen argument
Date: Sun, 12 Oct 2003 09:46:33 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310120946.33459.Herman@AerospaceSoftware.com>
References: <200310120141.15894.Herman@AerospaceSoftware.com> <20031012110847.GA571@pcw.home.local>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031012110847.GA571@pcw.home.local>
Content-Disposition: inline
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

On Sunday 12 October 2003 5:08 am, Willy TARREAU wrote:
   Hi !

   On Sun, Oct 12, 2003 at 01:41:15AM -0600, Herman wrote:
   > Now, I get this result with iptables 1.2.7a-2mdk and with 1.2.9rc1:
   >
   > # iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 6390 \
   >  -j DNAT --to 192.168.10.245
   > iptables: Invalid argument

   your kernel might be too old and incompatible with these more recent
 versions. I got the same when upgrading from iptables-1.2.4 to 1.2.5, IIRC.

   Willy

Hmm, this is Mandrake 9.1 distro and it did work in the past, but kind of 
unreliably.  So I should try an older version of netfilter - any 
recommendations for a version to try?

The funny thing is that the Masquerade line in my firewall setup gives the 
same Invalid Argument error but it actually works.  It is only Port 
Forwarding that doesn't work.

Cheers,
-- 
Herman

