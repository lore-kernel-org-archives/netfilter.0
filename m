From: "Paul Herbosch" <paul@hypervision.be>
Subject: Host forwarding: unable to upload files via FTP
Date: Mon, 17 Nov 2003 15:04:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BGEHIEBLHPBNPDEMEKOMMELECHAA.paul@hypervision.be>
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi all,

I'm running Redhat 9 (2.4.20-20.9) and iptables v1.2.7a

I set up a PPTP tunnel to a customer's LAN in order to reach a webserver and
a ftp server.
the tunnel works fine.

I wrote a little script that activates host forwarding to the other side of
the tunnel:
all pc's on my LAN connecting to my linuxbox on port 21 or 80 are being
forwarded to the servers on the other side of the tunnel.
http works great. only ftp is giving me some problems.
From any other pc in the LAN, I can logon to the ftp server, list
directories, create directories, delete files, download files etc.
The only thing that doesn't work is uploading files. Files smaller than 1
Kilobyte do successfuly upload, though.
If I wait long enough, The client retries the upload several times and
throws an error "Unknown Socket error"
and leaves a partially uploaded file on the server. eg. after a crashed
upload 'some.file' is 20Kb on serverside.
Original filesize: 34Kb

When I logon from the Linuxbox that sets up the tunnel there is no problem
whatsoever.

Here's the script. any help would be greatly appreciated.
Thx, Paul

# eth0 is the lan interface "10.174.0.14"
# ppp0 is the tunnel interface "$(ifconfig ppp0 | grep 'inet addr:' |
perl -pe 's/^.*?:(.*?) .*$/$1/')"
# 10.10.106.134 is the ftpserver on the other side of the tunnel
# 10.10.106.135 is the webserver on the other side of the tunnel


# load modules necessary for ftp-ing
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

# delete existing chains and restore default policies (ACCEPT)
/etc/init.d/iptables stop

# required proc configuration
echo "1" > /proc/sys/net/ipv4/ip_forward

# forward incoming requests to customer webserver
iptables -t nat -A PREROUTING -i eth0 -p tcp --sport 1024:65535 -d
10.174.0.14 --dport 80 -j DNAT --to-destination 10.10.106.135
iptables -A FORWARD -i eth0 -o ppp0 -p tcp --sport 1024:65535 -d
10.10.106.135 --dport 80 -m state --state NEW -j ACCEPT

# forward incoming requests to samsonite ftp server
iptables -t nat -A PREROUTING -i eth0 -p tcp --sport 1024:65535 -d
10.174.0.14 --dport 21 -j DNAT --to-destination 10.10.106.134
iptables -A FORWARD -i eth0 -o ppp0 -p tcp --sport 1024:65535 -d
10.10.106.134 --dport 21 -m state --state NEW -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --sport 1024:65535 -d
10.174.0.14 --dport 20 -j DNAT --to-destination 10.10.106.134
iptables -A FORWARD -i eth0 -o ppp0 -p tcp --sport 1024:65535 -d
10.10.106.134 --dport 20 -m state --state NEW -j ACCEPT

# route all returning traffic
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source $(ifconfig ppp0 |
grep 'inet addr:' | perl -pe 's/^.*?:(.*?) .*$/$1/')


