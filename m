From: Toby <tobia.conforto@linux.it>
Subject: Re: Deleting a rule from a DNAT chain
Date: Thu, 24 Mar 2005 15:37:37 +0100
Message-ID: <20050324143737.GB15012@ikkoku.ath.cx>
References: <B00976467560E749B3E981F36CA7D6B3146520@centratel01.telecoms.local>
	<424208DF.30709@riverviewtech.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <424208DF.30709@riverviewtech.net>
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

Grant Taylor wrote:
> iptables -t nat -D PortForwarding_3191 <rule number from the top of the 
> list starting with 1>

That is correct.  

To simplify things, first open a large xterm and do:

	iptables -t nat -L PortForwarding_3191 -n -v --line-numbers
	
and look up the rule number.  Then use:

	iptables -t nat -D PortForwarding_3191 <rule num>

Just make sure that you're deleting that from the startup scripts or
whatever it is that loads the rules when you reboot the machine.


Toby

-- 
Love(n): The delusion that one woman differs from another.
						H.L. Mencken

