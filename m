From: Gustavo Narea <me@gustavonarea.net>
Subject: Port redirection not working
Date: Thu, 24 Jan 2008 12:43:43 +0100
Message-ID: <200801241243.43277.me@gustavonarea.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_vnHmHRRevwZxUHD"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Boundary-00=_vnHmHRRevwZxUHD
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, everyone.

I'm new to netfilter and I'm trying to set a port redirection from port 80 to 
port 8080.

I'm using this line in the attached file:
-A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080

But there's something wrong with it, and I don't know what.

When I run `iptables-restore < /etc/iptables.config', I get this error:
iptables-restore: line 7 failed

I'm using Debian Etch.

Thanks in advance!
-- 
Gustavo Narea.
http://gustavonarea.net/

Get GNU/Linux! http://www.getgnulinux.org/

--Boundary-00=_vnHmHRRevwZxUHD
Content-Type: text/plain;
  charset="utf-8";
  name="iptables.config"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="iptables.config"

*filter
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state INVALID -j DROP
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
-A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
-A INPUT -p tcp -j REJECT --reject-with tcp-reset
-A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
-A INPUT -j REJECT --reject-with icmp-proto-unreachable
-A FORWARD -j REJECT --reject-with icmp-port-unreachable
COMMIT
--Boundary-00=_vnHmHRRevwZxUHD--
