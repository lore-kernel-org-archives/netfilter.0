From: Toby <tobia.conforto@linux.it>
Subject: Re: -m iplimit
Date: Thu, 24 Mar 2005 15:24:43 +0100
Message-ID: <20050324142443.GA15012@ikkoku.ath.cx>
References: <7866.1111612597@www37.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7866.1111612597@www37.gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Manuel Schmitz wrote:
> I can't load the module iplimit:
> # modprobe ipt_iplimit
> modprobe: Can't locate module ipt_iplimit
> 
> I found the libipt_iplimit.so module in the same place as lipipt_limit.so.
> So, why doesn't it work? 

/lib/iptables/libipt_iplimit.so is a module for /sbin/iptables

/lib/modules/.../ipt_iplimit.* are modules for netfilter itself.

Thus my impression is that your /sbin/iptables supports this extension
while your kernel does not. 

Make sure you have applied the patch correctly.


Toby

