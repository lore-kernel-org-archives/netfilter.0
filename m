From: Edward Shornock <netfilter@crazeecanuck.homelinux.net>
Subject: iptables geoip match
Date: Wed, 23 Mar 2005 17:06:38 -0500
Message-ID: <4241E86E.10208@crazeecanuck.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> The only extra files you need is a binary db (geoipdb.bin) & its index file (geoipdb.idx).
> Both files are generated from a countries & subnets database with the csv2bin tool,
> available at www.cookinglinux.org/geoip/. Both files MUST also be moved in /var/geoip/
> as the shared library is statically looking for that pathname (ex.: /var/geoip/geoipdb.bin).


The site "www.cookinglinux.org" has been down for at least a week that I 
know of.  Does anyone have the file "csv2bin" mirrored somewhere, or 
know where it can be found?

Thanks in advance.

