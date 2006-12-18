From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Interesting article about punching holes in firewalls...
Date: Sun, 17 Dec 2006 20:51:44 -0600
Message-ID: <45860240.2040102@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-bounces@mailman.ds9a.nl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Linux Advanced Routing and Traffic Control <lartc@mailman.ds9a.nl>, Mail List - Netfilter <netfilter@lists.netfilter.org>

I ran across an interesting article 
(http://www.heise-security.co.uk/articles/print/82481) (1) that I think 
any and all firewall administrators should take a few moments to read.

I personally have known that using "-m state --state 
ESTABLISHED,RELATED" was not the most secure thing to use for returning 
traffic.  Namely this will allow you to make a valid connection to a web 
server, say to retrieve a picture.  Then said web server could send 
malicious traffic back to your computer and pass through your firewall. 
  This is because the traffic coming from the web server to your 
computer is now deemed as RELATED.  Previously I have written this off 
as not needing to worry about this (much) YET.  Yet being the operative 
word.  I have long known that I would, especially on more secure 
installs (read not SOHO) need to filter inbound traffic based on source 
/ destination port.  I just have not thought that it was important 
enough to do presently for my clientele.  Unfortunately, the day where 
we do as much filtering on related traffic as we do on non related 
traffic may be closer at hand than we all would like to admit.  :(



Grant. . . .


(1) Is a /. article "How Skype Punches Holes in Firewalls" 
(http://it.slashdot.org/article.pl?sid=06/12/15/191205)
