From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Re: iptables 1.2.11
Date: Sat, 28 Aug 2004 10:44:19 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408281044.20001.pandre@darkstar.nom.za>
References: <200408281038.56978.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200408281038.56978.pandre@darkstar.nom.za>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 28/08/2004 10:38, Paulo Andre wrote:
> I have just installed a new kernel (2.4.27).
> I patched the kernel to handle pptp/gre conntrack.
> I also installed iptables 1.2.11 on this server, after the kernel build I
> installed iptables and that went through fine.
>
> When I restart the server the new kernel works great, but iptables gives me
> an error of 'iptables: Invalid argument' for any -t nat rules.
> Have I missed an option on the kernel rebuild?
>
> Paulo

To add to this, I have then rebooted the server and gone back to the old 
kernel and still I have problems with the iptables when trying to add '-t 
nat' rules.

Paulo


