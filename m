From: Herman <Herman@AerospaceSoftware.com>
Subject: Invalid friggen argument
Date: Sun, 12 Oct 2003 01:41:15 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310120141.15894.Herman@AerospaceSoftware.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi everybody,

I am trying to get port forwarding to work.  I had it working some time ago 
gawdknows what changed...

Now, I get this result with iptables 1.2.7a-2mdk and with 1.2.9rc1:

# iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 6390 \
 -j DNAT --to 192.168.10.245
iptables: Invalid argument

I can cut and paste a line from a howto and I still get 'invalid argument' - 
grrr...

Any ideas?

Cheers
-- 
Herman

