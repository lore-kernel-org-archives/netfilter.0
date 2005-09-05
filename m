From: cookie <cookie@iacookie.net>
Subject: proper context for connbytes
Date: Mon, 5 Sep 2005 11:51:41 -0400
Message-ID: <A6B8B856-F6B9-40C6-9DF1-6697BDAF9A9B@iacookie.net>
References: <20050816051846.846924C62E@crs.ultradns.net>
Mime-Version: 1.0 (Apple Message framework v734)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050816051846.846924C62E@crs.ultradns.net>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hello-
   After trying out several modules from Modwall
http://www.stearns.org/modwall/
   I was stumped when I encountered the mapssh module.
http://www.stearns.org/modwall/mapssh

##    The mapssh module uses some very tight checks to identify the SSH
##protocol string found at the beginning of a connection.  Because it
##strictly limits how many packets it inspects, it _should_ not produce
##high load on the system, even when inspecting every tcp connection.
##There is a small chance of false positives and/or false negatives.
/sbin/iptables -N mapssh
/sbin/iptables -F mapssh
/sbin/iptables -A mapssh -m u32 --u32 '0>>22&0x3C@ 12>>26&0x3C@  
0=0x5353482D' -j LOG --log-prefix mapssh
/sbin/iptables -A INPUT -i ! lo -p tcp ! -f -m connbytes --connbytes  
0:255 -m state --state ESTABLISHED -m length --length 46:375 -j mapssh
/sbin/iptables -A FORWARD -p tcp ! -f -m connbytes --connbytes 0:255 - 
m state --state ESTABLISHED -m length --length 46:375 -j mapssh
/sbin/iptables -A OUTPUT -p tcp ! -f -m connbytes --connbytes 0:255 - 
m state --state ESTABLISHED -m length --length 46:375 -j mapssh

   It all goes well till it hits the 4th line (the first that uses  
connbytes) then it kicks out:
iptables v1.3.3: You must specify `--connbytes'`--connbytes- 
direction' and `--connbytes-mode'
Try `iptables -h' or 'iptables --help' for more information.

   After a day of googling for the correct use of -m connbytes I am  
at a loss, I was hoping
someone could help me figure this out.  I have tried adding
--connbytes-dir original --connbytes-mode bytes but to no avail.

Thanks
Brian


