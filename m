From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: a discussion starter i hope.
Date: Thu, 13 Jun 2002 09:30:45 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0b1a01c212f7$ab1b9990$2901a8c0@amos>
References: <1020984749.22168.19.camel@sarig.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1020984749.22168.19.camel@sarig.internal>
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
To: 'alan barrow' <aaa.coms.sec@btclick.com>, netfilter@lists.samba.org


Hi Alan,
 
> Now behind the firewall are 2 separate servers, each running a web
> service and each running on port 80. 
> 
> 1) The question is, with only 1 real world address available to you,
> what suggestions do you guy's have as to the configuration required to
> make both web servers available on the Internet ? So that incoming
port
> 80 request on the firewall public interface go to the correct server. 


If you are solely interested in distributing http requests from a single
access point I would suggest running apache as a reverse proxy on your
firewall. This way http requests for different domains can be directed
to different internal (or external) web servers. Optionally this could
be done on layer 4 with DNAT, by rewriting the destination of packets
and perhaps adding a user level program to direct packets but I am less
knowledgeable about the implementation of such a setup.

Here is a simple example of a reverse proxy apache configuration.

<VirtualHost *:80>

 DocumentRoot "/usr/local/apache/htdocs/server.tld"
 ServerName public.server.tld

 # Rewrite URL to back-end server URL
 RewriteEngine on
 RewriteLog logs/proxy_rewrite
 RewriteLogLevel 0

 RewriteRule ^/(.*)$ http://www1.server.internal/$1 [P]

 # Reverse Proxy the requested URL

 ProxyRequests on
 ProxyVia on
 ProxyPassReverse / http://www1.server.internal/

</VirtualHost>


