From: "Ashutosh Naik" <ashutosh.naik@gmail.com>
Subject: Kphone not opening a secondary SIP direct connection
Date: Fri, 13 Oct 2006 15:49:19 +0530
Message-ID: <81083a450610130319v12fb5585vf64f95ff64734933@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kphone-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kphone-devel>, 
	<mailto:kphone-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=kphone-devel>
List-Post: <mailto:kphone-devel@lists.sourceforge.net>
List-Help: <mailto:kphone-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kphone-devel>,
	<mailto:kphone-devel-request@lists.sourceforge.net?subject=subscribe>
Sender: kphone-devel-bounces@lists.sourceforge.net
Errors-To: kphone-devel-bounces@lists.sourceforge.net
To: kphone-devel@lists.sourceforge.net
Cc: netfilter@lists.netfilter.org

Hi guys,

I am using kphone 4.2 in my setup, where I am connecting to the
internet behind a router. What I observe is that my kphone client is
unable to establish a secondary direct connection with the other
user's  SIP client

I think SIP allows a secondary direct connection, and netfilter ALGs
have also been written to allow this ( ip_conntrack_sip.c and
ip_nat_sip.c ).

Please let me know if this is a kphone client issue ( The client is
not initiating a secondary connection ) or it is something else.

Kindly CC me on the replies, I am not subscribed to the list yet.

Regards
Ashutosh

-------------------------------------------------------------------------
Using Tomcat but need to do more? Need to support web services, security?
Get stuff done quickly with pre-integrated technology to make your job easier
Download IBM WebSphere Application Server v.1.0.1 based on Apache Geronimo
http://sel.as-us.falkag.net/sel?cmd=lnk&kid=120709&bid=263057&dat=121642
