From: dan radom <netfilter@radom.org>
Subject: Re: Startup script
Date: Fri, 16 Apr 2004 04:02:38 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040416100238.GC1439@hamachi.radom.org>
References: <20040416114221.8E7B9CE2F8@firewall.gateway10.homeip.net>
Reply-To: netfilter@radom.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040416114221.8E7B9CE2F8@firewall.gateway10.homeip.net>
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

* stu (stu@gateway10.homeip.net) wrote:
> Hi All
> 
> Where is the best place to put my firewall script, for example when the
> firewall is booted.
> 

That depends entirely on your distros init scripts.  You left that detail
out though.  Try /etc/init.d/rc.local perhaps.

dan

