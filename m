From: "Heiko Fischer" <electropunk@web.de>
Subject: Re: Problem reading an URL with Java through IPTables/Squid proxy
Date: Tue, 5 Aug 2003 00:58:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c35adb$ea6aa0a0$0200a8c0@hf.home.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

George,

thanks for responding to my message.
Fortunately, I've just been able to fix the problem by setting the following
system properties in my Java environment:

System.getProperties().put("proxySet", "true");
System.getProperties().put("proxyHost", "myProxyMachineName");
System.getProperties().put("proxyPort", "myProxyPort");

Seems that Squid chokes when receiving HTTP requests which have been
redirected by IPTables from a different port.
Without the above settings, Java tries to connect on the standard HTTP port
(80), and these connections are being redirected to port 3128 (the port
Squid listens on in my configuration).
The reason why it works in my Win2k environment without the above settings
is that the Win2k firewall allows direct HTTP connections, thus bypassing
the proxy server.
Besides, the Squid log entries are now correct, too (complete URLs, protocol
HTTP/1.0 etc).

Regards,

Heiko Fischer


----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "Heiko" <electropunk@web.de>; <netfilter@lists.netfilter.org>
Sent: Tuesday, August 05, 2003 12:12 AM
Subject: RE: Problem reading an URL with Java through IPTables/Squid proxy


"GET /intl/de/about.html HTTP/0.0"
Your Java applet isn't using proper HTTP protocols and should send a
HTTP/1.0 or HTTP/1.1 to the website..
I do this already in PHP to check website uptime etc and works fine.

This is something you need to send to the web server..


GET /webchecker.jsp HTTP/1.0\r\n
Cache-Control: no-cache\r\n
Expires: Mon, 26 Jul 1997 05:00:00 GMT\r\n
Pragma: no-cache\r\n
Host:www.citadelcomputer.com.au\r\n
\r\n

<2 sets of CRLF to tell the webserver your finished>



Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


