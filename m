From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: IPTables and 2.4.19 Kernel
Date: Sat, 23 Nov 2002 06:04:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021123060450.2ce9cd1e.arnt@c2i.net>
References: <Pine.LNX.4.33.0211221609230.279-100000@ts1.alberni.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0211221609230.279-100000@ts1.alberni.net>
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

On Fri, 22 Nov 2002 16:12:50 -0800 (PST), 
Aaron Clausen <maureen-taocow@alberni.net> wrote in message 
<Pine.LNX.4.33.0211221609230.279-100000@ts1.alberni.net>:

> I have been running an older version of iptables 1.2.2 under 2.4.9.  I
> have been unable to patch this kernel to iptables 1.2.7a, so I
> downloaded the 2.4.19 source.  I patched this kernel fine, but whether
> I compile iptables as modules or right into the kernel, when I boot
> into 2.4.19, I get the following errors on most of my rules:
> 
> iptable: Invalid argument
> 
> When I reboot into 2.4.9, everything works.  I have upgraded the
> iptables binary to 1.2.7a, and it works under 2.4.9.  Am I missing
> something?
> 

..a shot in the dark:  Get your .config for your 2.4.9 and 
run 'make oldconfig' from that on your 2.4.19.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



