From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Problem with Transparent Proxy, Squid and 2.6 kernel
Date: Fri, 09 Jan 2004 06:47:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073623629.2014.10.camel@raylinux.internal>
References: <2307E2C1-4139-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2307E2C1-4139-11D8-AFEE-000393677A36@porchlight.ca>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 2004-01-07 at 19:44, Peter Schobel wrote:
> I have a server that was running a transparent redirection proxy - i 
> was using 2.4.20 kernel on this system and i recently upgraded to 
> 2.6.0.107 kernel package for redhat 9
> 
> Ever since i did the kernel upgrade the proxy does not work correctly.
> 
> As far as I know, the kernel is configured properly
> 
> lsmod shows these iptables modules
> 
> Module                  Size  Used by
> ipt_REDIRECT            2048  0
> iptable_nat            20140  1 ipt_REDIRECT
> ip_conntrack           28464  2 ipt_REDIRECT,iptable_nat
> iptable_filter          2688  0
> ip_tables              15104  3 ipt_REDIRECT,iptable_nat,iptable_filter
> 
> my INPUT, FORWARD and OUTPUT policies are all set to accept
> 
> iptables -L
> 
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> I am using this iptables rule
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
> --to-port 3128
> 
> my nat table looks like this
> 
> iptables -t nat --list
> 
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> REDIRECT   tcp  --  anywhere             anywhere           tcp 
> dpt:http redir ports 3128
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> ip forwarding is enabled
> 
> cat /proc/sys/net/ipv4/ip_forward
> 1
> 
> squid is running on 3128 - the squid config looks like this
> 
> acl all src 0/0
> 
> visible_hostname proxyhost.porchlight.ca
> 
> http_port 3128
> 
> no_cache deny all
> 
> redirect_program /usr/local/bin/redirector.pl
> redirect_children 5
> redirect_rewrites_host_header on
> redirector_access allow all
> 
> http_access allow all
> http_reply_access allow all
> 
> httpd_accel_port 80
> httpd_accel_host virtual
> httpd_accel_with_proxy on
> httpd_accel_uses_host_header on
> 
> This configuration has not changed since before the kernel upgrade 
> except that there were a couple of rules preventing proxy access to the 
> outside world which I removed in order to make things as simple as 
> possible for debugging purposes
> 
> I can see by running snort that the packets destined for the remote 
> host are arriving on the interface
> 
> I can see using "iptables -t nat --list -v -n" that the number of 
> packets on the REDIRECT rule gets incremented by 1 each time I try to 
> access a remote site - but the browser just times out waiting for a 
> reply and the squid access.log does not record the access
> 
> If i type http://proxyhost.porchlight.ca into the address bar of the 
> browser, the port redirect works perfectly and squid redirects the 
> traffic to the proxied site without problem - it is only when I attempt 
> to access remote sites that the redirection does not work.  As I 
> mentioned before - this was all working and tested previous to the 
> kernel upgrade.
> 
> I've been struggling with this for a couple days now.  Does anyone have 
> any idea why this configuration is not working?
> 
> Thx in advance,
> 
> *****************************
> Peter Schobel
> Network Administrator
> Porchlight.ca
> Unlimited Internet
> *****************************
> In a world without walls or fences
> We will have no need for gates or windows
> *****************************
> 
> 
What version of iptables are you using?

I use iptables v1.2.8 with the 2.6.0 kernel on SuSE and it works fine,



