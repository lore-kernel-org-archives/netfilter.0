From: "azeem ahmad" <azeem484@hotmail.com>
Subject: weired problem while connecting
Date: Tue, 01 Jun 2004 22:14:44 +0000
Sender: samba-bounces+gnsg-samba=m.gmane.org@lists.samba.org
Message-ID: <BAY15-F5oHMwVN7miR90003b234@hotmail.com>
Mime-Version: 1.0
Return-path: <samba-bounces+gnsg-samba=m.gmane.org@lists.samba.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/mailman/listinfo/samba>,
	<mailto:samba-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/archive/samba>
List-Post: <mailto:samba@lists.samba.org>
List-Help: <mailto:samba-request@lists.samba.org?subject=help>
List-Subscribe: <http://lists.samba.org/mailman/listinfo/samba>,
	<mailto:samba-request@lists.samba.org?subject=subscribe>
Errors-To: samba-bounces+gnsg-samba=m.gmane.org@lists.samba.org
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samba@lists.samba.org, netfilter@lists.netfilter.org

hi all
i m connecting to my samba server from a windows xp client. whenever i 
started my firewall script the client used to take 4 minutes to connect to 
the samba server and i run IRIS (sniffer) on my windows xp box it captures a 
packet as shown below
-------------------------------------------------------------------------------------------------------------------------------------
OPTIONS / HTTP/1.1
translate: f
User-Agent: Microsoft-WebDAV-MiniRedir/5.1.2600
Host: Subzero
Content-Length: 0
Connection: Keep-Alive

HTTP/1.0 504 Gateway Time-out
Server: squid/2.5.STABLE1
Mime-Version: 1.0
Date: Mon, 31 May 2004 18:13:57 GMT
Content-Type: text/html
Content-Length: 1056
Expires: Mon, 31 May 2004 18:13:57 GMT
X-Squid-Error: ERR_CONNECT_FAIL 110
X-Cache: MISS from proxy.ravians-hostel.net
Connection: keep-alive


ERROR
The requested URL could not be retrieved
--------------------------------------------------------------------------------

While trying to retrieve the URL:
http://subzero/

The following error was encountered:

Connection Failed

The system returned:
    (110) Connection timed out

The remote host or network may be down.  Please try the request again.
Your cache administrator is Mumraiz-Khan.

--------------------------------------------------------------------------------

Generated Mon, 31 May 2004 18:13:57 GMT by proxy.ravians-hostel.net 
(squid/2.5.STABLE1)

-------------------------------------------------------------------------------------------------------------------------------------

but if i disable transparent redirection from my firewall then it takes 
about 20 seconds or dont run the firewall then it browses the samba server 
noramally. the firewall script is as below. and also in the latter two 
conditions IRIS doesnt caputre this packet shown above
here is the firewall
-------------------------------------------------------------------------------------------------------------------------------------
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -F
iptables -t nat -F

modprobe ip_nat_ftp

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 42   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 88   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 88   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 135  -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 137  -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 138  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 138  -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 139  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 389  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 636  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 445  -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 445  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 3268 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 3269 -j ACCEPT

iptables -P INPUT DROP
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 443       -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5000      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5001      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5005      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5050      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 7000      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 28805     -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 51215     -j ACCEPT

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
-------------------------------------------------------------------------------------------------------------------------------------

Regards
Azeem

_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail

-- 
To unsubscribe from this list go to the following URL and read the
instructions:  http://lists.samba.org/mailman/listinfo/samba
