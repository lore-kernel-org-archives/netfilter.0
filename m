From: dhottinger@harrisonburg.k12.va.us
Subject: redirect
Date: Fri, 02 Mar 2007 07:41:07 -0500
Message-ID: <20070302074107.401q9rza8kwowwgs@mail.harrisonburg.k12.va.us>
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I posted a question yesterday and I dont think I worded it very well.   
Im having problems with software updates on Apple computers.  I think  
it is an issue with my squid proxy server.  So I would like to make a  
rule set that says redirect all port 80 traffic except traffic going  
to apple.com's software update servers.  When connecting to apple  
software updates you connect to swscan.apple.com which downloads an  
xml file, then get redirected to an akamaitechnologies.com server for  
the downloads.  Im not quite certain yet why things are failing with  
my squid proxy server in the loop, but going around it lets the  
software updates work.  So, if any of the iptables gurus have a  
formula for this I would be very happy to try.

thanks,

ddh


-- 
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools


