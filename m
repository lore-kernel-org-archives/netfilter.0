From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirect from internet to a LAN computer
Date: Wed, 5 May 2004 00:01:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405050001.43557.Antony@Soft-Solutions.co.uk>
References: <40981822.8080406@med-orden.com.co>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40981822.8080406@med-orden.com.co>
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

On Tuesday 04 May 2004 11:24 pm, Hernan Dario Arredondo wrote:

> Hi every one... this is my question...
> I had a Web Server running in a Solaris Sparc for test in my enterprise
> LAN with private IP (192.168.2.XX) and no connection to Internet, but I
> need to demo my apps to external clients.

No connection to the Internet?   Then it is not accessible to external 
clients.   You need a route to the outside world for the outside world to 
reach the machine.

> I don't want to install the Web Server in my gateawy Internet server, is any
> way to redirect a port in the gateway to my Web Server...

If you have a gateway router between the machine and the Internet then a 
simple NAT rule will allow people to see the web server.

Any tutorial linked from http://www.netfilter.org/documentation will tell you 
to set this up.

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


