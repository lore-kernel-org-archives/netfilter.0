From: a.ledvinka@promon.cz
Subject: Re: FTP Connection problems.
Date: Tue, 24 Aug 2004 15:17:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF4836F3F4.C284CFF8-ONC1256EFA.0048A028-C1256EFA.00490AF0@promon.cz>
References: <1093352834.1894.16.camel@lbedlbxl.dev.xtra-net.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093352834.1894.16.camel@lbedlbxl.dev.xtra-net.org>
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
To: netfilter@lists.netfilter.org

modprobe ip_nat_ftp             - if passive works but active writes error 
after PORT command or hangs.
modprobe ip_conntrack_ftp       - if forwarding rule filtering based on 
state. remember to accept RELATED tcp connections.

see
modinfo ip_conntrack_ftp
...
parm:        ports int array (min = 1, max = 8)

if you want to access ftp servers unusual ports. then you would have to 
add some entry to /etc/modules.conf with options line or in script you use 
add ports parameter.

