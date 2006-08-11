From: Jeffrey Paul <jeffrey.paul@121media.com>
Subject: load balancing with REDIRECT - what is the best way?
Date: Fri, 11 Aug 2006 13:59:13 -0400
Message-ID: <73E0FE76-7EE0-4EC7-904B-17E157A4D0DC@121media.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


I'm trying to perform some simple load balancing using the REDIRECT  
target.

Right now, I'm using -p tcp --dport 80 -j REDIRECT --to-ports 3128 to  
transparently proxy web traffic to a running squid.

I'd like to be able to balance between several running squid  
processes, say, on 3128, 3129, 3130, and 3131.

The --to-ports option to REDIRECT says it can take a port range,  
which I tried ("--to-ports 3128-3131"), but it only rewrites the dest  
port to 3128.  What is a port range option to --to-ports ever used for?

Next up, if I can't get this method working, is to try to use the nth  
or random modules to select SYNs to redirect to various ports.  Will  
I need to use connection marking to differentiate which ports I am  
redirecting a given set of tcp packets (a connection) to, or will the  
built in connection tracking automatically rewrite subsequent packets  
in the same connection with the same dest port it gave the first one?

Also, I read somewhere that nth and random aren't in patch-o-matic-ng  
anymore because they're being included into .18.  As they're not yet  
in the latest .18-rc, is there any currently recommended way of  
getting them into a production system other than using the last patch- 
o-matic-ng snapshot they're in (20060511)?

Cheers,
-j

--
Jeffrey Paul, 121Media - jeffrey.paul@121media.com
646-217-0598 x5333
264 W. 40th St, New York, NY 10018




