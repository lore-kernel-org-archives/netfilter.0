From: Francois LE BOURDELLES <flebourdelles@free.fr>
Subject: iptables, ftp conntrack and module helper
Date: 13 May 2003 00:23:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052778227.26733.62.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello again,

Now I want to use the ftp_conntrack,

I created a new table : new_table

I just used this command :

insmod ip_conntrack_ftp
iptables -A INPUT -m helper --helper ftp -j new_table

do I have to do something to see FTP related packet entering the
new_table filter
(like standard FTP tracking on RELATED; NEW or somethnig else uponthe
port 21 or 20 ...) ?
Does the helper do the job alone ?
Because on my test bench .... it does nothing at all (maybe I missed
something else)

Regards.
-- 
Francois LE BOURDELLES <flebourdelles@free.fr>


