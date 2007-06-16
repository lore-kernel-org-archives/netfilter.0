From: Chris Spiegel <netfilter@happyjack.org>
Subject: NAT blocking HTTP .. But only some of it.
Date: Fri, 15 Jun 2007 23:06:02 -0700
Message-ID: <200706152306.02114.netfilter@happyjack.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I'm having a bit of an issue with IP masquerading: Boxes behind my NAT 
system work, to a degree.  Some protocols seem fine; IRC and rsync both 
appear to work.  HTTP acts very strange, though.

I can issue a HEAD request.  That works fine.  If I issue a GET request that 
results in a 301 redirect, that works fine.  If, on the other hand, I issue 
a GET request that results in a 200 OK, things break down.  The headers are 
sent just fine, as is the \r\n\r\n signalling the end of the headers.  But 
the page never comes.  The same thing happens with a 404.  Headers, no 
body.

FTP is dodgy.  Ftping sometimes gives me just one line of response before 
hanging, sometimes I can log in.  Sometimes I can get directory listings, 
although I've never successfully been able to download a file; I do have 
FTP connection tracking enabled.  It seems to depend on the FTP server.

The precision of the problem would make me think that it's perhaps an issue 
with my ISP, but everything works fine on kernel 2.6.17 (and 2.6.17.14, for 
that matter).  The problem arose in 2.6.18-rc1 and persists to my current 
setup, 2.6.21.5.  I hadn't really noticed it until recently when I put a 
real computer behind the box; till then I only used qemu, and that 
sporadically.

My iptables setup is the following:
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state \
  --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
$IPTABLES -A INPUT -i $INTIF -j ACCEPT

I generally have more rules (not related to NAT), but I've tested with just 
the above, resulting in the same problems.  It seems something happened 
with 2.6.18-rc1, and for the life of me I don't know what.

Chris

