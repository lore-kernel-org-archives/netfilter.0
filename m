From: Willy TARREAU <willy@w.ods.org>
Subject: Re: Invalid friggen argument
Date: Sun, 12 Oct 2003 13:08:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031012110847.GA571@pcw.home.local>
References: <200310120141.15894.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200310120141.15894.Herman@AerospaceSoftware.com>
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
To: Herman <Herman@AerospaceSoftware.com>
Cc: netfilter@lists.netfilter.org

Hi !

On Sun, Oct 12, 2003 at 01:41:15AM -0600, Herman wrote:
 
> Now, I get this result with iptables 1.2.7a-2mdk and with 1.2.9rc1:
> 
> # iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 6390 \
>  -j DNAT --to 192.168.10.245
> iptables: Invalid argument

your kernel might be too old and incompatible with these more recent versions.
I got the same when upgrading from iptables-1.2.4 to 1.2.5, IIRC.

Willy


