From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: public IP behind NAT system
Date: Fri, 3 Oct 2003 09:38:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003103051.26E931B8D7@smtp.ttp.nl>
References: <200310022320.10454.libolt@libolt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310022320.10454.libolt@libolt.net>
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

> outside router --> NAT system --> other systems with public IPs.
> 
> I am wondering if this is possible and feasable with 
> netfilter.  I don't want netfilter to NAT any packets sent to 
> the public IPs that aren't on the NAT system.
> 
> Any help is greatly appreciated,

If there are only "other systems with public IPs", then I'd say there's
no need for a "NAT system". The only thing you want to do would be
filtering ?
You can just allow forwarding for IP's that you want and route the
packets through your firewall.
If you also have other systems that have private IP's then you just NAT
those IP's, in addition to the above.


Gr,
Rob


