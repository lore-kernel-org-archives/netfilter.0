From: "L.W. van Braam van Vloten" <lucas2@dds.nl>
Subject: Using iptables to send local traffic to proxy
Date: Tue, 02 Jun 2015 16:59:33 +0200
Message-ID: <20150602165933.Horde.OYlnRWEwhY5VbcTVsieGKGA@webmailnew.dds.nl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello list,

I would like to use iptables to send all traffic that originates from  
the local host to a specific internet address through a proxy in my  
local network. The connection is encrypted between my host and the  
final destination. The connetcion is authenticated using a client  
certificate. The proxy is capable of proxying encrypted connections.

The traffic originates from an application running on the Linux box  
itself. The application cannot be configured to use the proxy or to  
use the https_proxy environment variable. I was told that I can use  
iptables to accomplish some kind of "transparent proxy": the  
application believes it talks directly to the internet address, but  
the firewall sends the traffic through the proxy. The application  
itself is entirely unaware of the proxy.

Can it be done? I would appreciate some help with the rule to accomplish this.

I can test the connection using curl:
$ curl -E ./client-certificate.pem https://webservice.example.com/incoming
This works on a direct internet connection (without proxy).
(The URL gets resolved to the internet IP address even if there is no  
direct internet connection.)

I tried the following ideas (plus some variations) that did not work:
iptables -t nat -A PREROUTING -d <internet-IP> -p tcp -j DNAT --to  
<proxy-IP:port>
My curl test gives a "Network is unreachable"

iptables -t nat -A OUTPUT -d <internet-IP> -p tcp --dport 443 -j DNAT  
--to-destination proxy-IP:port
My curl test gives a "Network is unreachable"
In combination with a
ip route add <internet-IP>/32 via <proxyIP> dev eth1
My curl test gives a "SSL connect error"

Thanks for any help!

Kind regards,
Lucas


