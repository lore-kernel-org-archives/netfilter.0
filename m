From: forum@users.pc9.org
Subject: RE: Redirect ports on localhost
Date: Tue, 23 Mar 2004 20:57:18 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <jbm.20040323205718.fa7a8555@alkaid.pc9>
References: <jbm.20040323200102.07b7ea44@alkaid.pc9>
  <200403240252.i2O2qesV018945@server5.bandwidthco.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403240252.i2O2qesV018945@server5.bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> I remember struggling with this a while.  Beat my head against the wall
> for a month.  I finally discovered (after enabling bind debugging mode)
> the problem was in my named.conf file:
> 
> ##########################
> # PORTS
> ##########################
> # The listen-on record contains a list of local network interfaces to
> listen on. Optionally the port can be
> # specified. Default is to listen on all interfaces found on your
> system. The default port is 53.
>     listen-on port 53 { 192.168.1.1; };
>     query-source address * port 53;

This isn't the case for me, though -- in fact, I'm not using BIND but 
rather rbldnsd and specifying that I wish to listen on all interfaces. And 
I know it does respond, because if I run 'nslookup' and then 'set port=
5300' and make my query, there is a response.

But if the port is on the default 53, the PREROUTING doesn't appear to 
rewrite the destination port.

-- 
forum@users.pc9.org



