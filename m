From: Jason Opperisano <opie@817west.com>
Subject: Re: Forward with IPTABLES
Date: Thu, 13 Jan 2005 09:01:26 -0500
Message-ID: <1105624886.8185.26.camel@hubcap.ljm.dom>
References: <001a01c4f8f9$9de78f00$0100a8c0@betasvr.noip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001a01c4f8f9$9de78f00$0100a8c0@betasvr.noip.org>
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

On Wed, 2005-01-12 at 17:54, Guillermo Javier Nardoni wrote:
> Hello, could you let me know if i can forward incoming packets from a
> specific IP address to an internal Server?
> 
> for example.
> we have a linux box running Red Hat 9 (Shrike) with this Networking
> configuration.
> 
> eth0 (sis9000) ip: 10.0.0.1 (connected to an ADSL "modem" (Cisco 677))
> ppp0 Internet Conection using PPPoE through eth0 which is connected the ADSL
> (Dynamic IP)
> eth1 (rtl8139) ip: 192.168.0.1 (connected to the internal network and acting
> as Transparent Proxy (with Squid and IPTABLE)
> 
> the other Server (internal server) is running a Windows 2000 SP4
> eth0: rtl8139 ip: 192.168.0.2
> 
> what i want to do is this:
> 
> we have 2 domains hosted by our servers (www.domainA.com and
> www.domainB.com)
> when a customer asks for a webpage (through ppp0) port 80 at www.domainA.com
> i want to redirect it to our Windows 2000 server (it domain is written in
> ASP), but when some customers ask for a webpage from the other one (domainB)
> the page must flow-back  to the customer from linux server instead of
> Windows.

since you only have 1 public IP address; and therefore, only one port
80--you need to get a little tricky.  basically, what you need to do is
setup a reverse proxy, either on the firewall itself (aaaaaaaaah), or on
another box.  send your <PUBLIC_IP>:80 traffic to the reverse proxy and
have it split the traffic based on the HTTP HEADER request information. 
this can be done with apache using mod_rewrite + mod_proxy:

  http://httpd.apache.org/docs-2.0/mod/mod_rewrite.html
  http://httpd.apache.org/docs-2.0/misc/rewriteguide.html
  http://httpd.apache.org/docs-2.0/mod/mod_proxy.html
  http://httpd.apache.org/docs-2.0/mod/mod_proxy_http.html

HTH...

-j

--
"My cat's breath smells like cat food."
	--The Simpsons


