From: Ramoni <ramoni@databras.com.br>
Subject: new connections
Date: Sun, 6 Feb 2005 05:20:25 -0200
Message-ID: <200502060520.25538.ramoni@databras.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

People...
What do you all think about make rules for new connections only ?
Make all rules for new connections (--syn) and let the -m state --state 
ESTABLISHED care about connectuions you have allowed ?

I' ll aplly a poatch on my firewall to support the raw table, to use the 
NOTRACK targe for cionnections that I does not need to track (and ensure a 
connection response) for example:
A connection from outside to my webserver, will always come from random port 
to port 80 of my server, and the response will be from port80 to any port 
outsdie.

Whats the really need to track this ? I can make rules allowing these and just 
make connectinio tracking for connections from inside to outside that I wont 
make rules expecting the response.

Sorry for the bad english, as usually.
Ramoni

