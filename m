From: David Cannings <lists@edeca.net>
Subject: Re: Redirect from internet to a LAN computer
Date: Tue, 4 May 2004 23:45:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405042345.04948.lists@edeca.net>
References: <40981822.8080406@med-orden.com.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40981822.8080406@med-orden.com.co>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 04 May 2004 23:24, Hernan Dario Arredondo wrote:
> Hi every one... this is my question...
> I had a Web Server running in a Solaris Sparc for test in my enterprise
> LAN with private IP (192.168.2.XX) and no connection to Internet, but I
> need to demo my apps to external clients. I don't want to install the
> Web Server in my gateawy Internet server, is any way to redirect a port
> in the gateway to my Web Server...

So long as the private IP is routable from your netfilter machine, DNAT 
should do the trick.  See the "NAT HOWTO" on the following page:

http://netfilter.org/documentation/index.html#documentation-howto

David

