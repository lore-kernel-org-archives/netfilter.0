From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Invalid friggen argument
Date: Sun, 12 Oct 2003 12:18:25 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121218.25934.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
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
To: markee@bandwidthco.com, netfilter@lists.netfilter.org

On Sunday 12 October 2003 11:44 am, Mark E. Donaldson wrote:
   I don't think you have a versioning problem.  Some of the more recent
   releases of netfilter are more sensitive about arguments and argument
   ordering I have found.  Are you able to slip in a destination address into
   that rule:

   iptables -t nat -A PREROUTING -i eth1 -p tcp -d xxx.xxx.xxx.xxx --dport
 6390 \
    -j DNAT --to 192.168.10.245

   It may be looking for a dest address.

I have tried that before and here goes:
iptables -t nat -A PREROUTING -i eth1 -p tcp -d 192.168.10.100 --dport 6390 -j 
DNAT --to 192.168.10.245
iptables: Invalid argument

No luck.

Cheers,
-- 
Herman 

