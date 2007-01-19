From: "saspan" <saspan@web.de>
Subject: redirecting on a local machine
Date: Fri, 19 Jan 2007 19:44:33 +0100
Message-ID: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
Mime-Version: 1.0
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi there,

I have serious trouble configuring a LTSP-server, wanting it to 
work as a transparent proxy using squid in order to secure 
web-access for our children.

The problem is to redirect TCP-requests to the machine itself.

More detailed: I want the tcp-requests from users logged into 
the LTSP-machine being redirected to the machines' proxy. 
As mentioned above the proxy is running on the same system.

A simple

iptables -t -nat -A OUTPUT -m owner ! --owner-uid squid -p tcp 
--dport 80 -j REDIRECT --to-destination 3128

doesn't seem to work, cause a browser would not be expecting a 
reply from a transparent proxy when waiting for replies to its requests.

What am I doing wrong here? Do the packets have to masked 
locally before redirecting them to the proxy?

Any help is appreciated as I have been guessing on this problem 
for three days.

Regards,
Sascha

