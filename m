From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 15:00:11 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <IMEDICLPAGAOCBLCCKLPGENCDLAA.netfilter@darrelldieringer.com>
References: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Big Daddy <bigdaddy@monster-solutions.net>, netfilter@lists.samba.org

Hello,

Have you confirmed that the packets are leaving the firewall / router
(by using tcpdump, etc)?  If they are, then it might be an IIS
configuration issue.  I had some trouble forwarding http connections
to internal IIS machines (IIS4 on NT4 Server and IIS5 on Win2K Pro).
After much head pounding, I found the solution to my problem.

<begin offtopic>
If I remember correctly...

On the main property page for the web site in IIS, the "IP Address"
field should be set to "All Unassigned" and the port must be set to
the same one that is being forwarded.  (ie, you must forward
$ext_ip:8080 to $int_ip:8080).  Though there's nothing about http that
requires the ports to match, IIS has some trouble.

For instance, if your arrangement is $ext_ip:8080 to $int_ip:80, IIS
replies to the initial request for whatever page with an http redirect
(302, I think).  Actually, it may only do this if the "IP Address"
field in the main propery page is set to something other than "All
Unassigned".  That redirect tells the client to ask for the page on a
different port.  If that port is blocked by your firewall or by your
ISP (as it is in my case), the client never receives the content
because the redirect was unsuccessful.
</offtopic>

It has been many months since I solved this problem for my own home
setup, so I don't remember all the details.  After confirming that the
packets are indeed on the wire, examine both your firewall logs and
your IIS logs for a clue to what's going on.

I know I delved offtopic for netfilter, but hopefully it ends up being
helpful to a couple of people.

Darrell


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Big Daddy
Sent: Monday, July 08, 2002 2:38 PM
To: netfilter@lists.samba.org
Subject: HTTP Port forwarding issues


all,
     for some reason i can get my smtp and pop3 to route from the
internet, but i cannot get http requests to forward correctly.
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport http -m
state --state NEW -j ACCEPT
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport smtp -m
state --state NEW -j ACCEPT (works)
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport pop3 -m
state --state NEW -j ACCEPT (works)

 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport smtp -j
DNAT --to-destination $int_smtp:25 (works)
 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport pop3 -j
DNAT --to-destination $int_pop3:110 (works)
 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport http -j
DNAT --to-destination $int_http:80

 web server is running IIS5.
any help would be great!
Big D@ddy


