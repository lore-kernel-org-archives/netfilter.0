From: Tommy McNeely <Tommy.McNeely@Sun.COM>
Subject: ip_conntract_ftp on another port
Date: Sun, 05 Jan 2003 00:15:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1041750954.22696.18.camel@cookies.local.redneck.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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

is it possible to use ip_conntrack_ftp on another port.. I dont see any
information about doing that in the FAQ, and there doesnt appear to be
an easy way to actually "SEARCH" the archives ;) .. I would like to run
my ftp server on a strange port (like say 6969) but the conntrack stuff
only appears to work if its on port 21 

Also.. what is the proper way to load these modules.. currently I just
have a /sbin/modprobe ip_conntrack_ftp in my /etc/rc.local file.. is
there something I could put into /etc/modules.conf ??

thanks in advance 
tommy


