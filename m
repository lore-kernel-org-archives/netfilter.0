From: "Sean E. Covel" <seanecovel@comcast.net>
Subject: FTP/SSL
Date: Thu, 16 Oct 2003 13:31:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066325478.22244.15.camel@localhost>
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
To: NetFilter-List <netfilter@lists.netfilter.org>

Is there any way to do connection tracking for incoming connections to
an FTP/SSL server?  I'm using a Bering (leaf.sourceforge.net)
mini-distro that uses the Shorewall firewall (www.shorewall.net).  

My firewall has both ip_net_ftp and ip_conntack_ftp, but as we all know,
these don't work for FTP/SSL.

I am attempting to port-forward the FTP/SSL connection from the firewall
machine to a server in a service network.  The "command" connection on
port 21 works just great, but when I try to GET, PUT, or LS a file,
basically anything that uses the data connection, the firewall blocks
the connection.  It appears that FTP/SSL uses a high port -> high port
connection for the data connection.

One possible solution (which I don't like!) is to open a large range of
high ports in the firewall.  This seems a bit primitive.  There must be
a way to associate the initial port 21 connection with the subsequent
high-port connection.

Thanks for your help,

Sean


