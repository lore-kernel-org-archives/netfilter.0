From: Thomas <thomas@larrson.id.au>
Subject: tunneling ftp
Date: Mon, 11 Jan 2010 14:10:05 +1100
Message-ID: <E4644986-2636-422B-B532-BE844F20BC72@larrson.id.au>
Mime-Version: 1.0 (Apple Message framework v1077)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have question about tunneling ftp traffic . Basically I would like to connect to remote ssh server and use ftp client to download/upload files through the tunnel.

Here is the situation: 
Local computer (A): 192.168.200.1
Firewall box with two interfaces (B): 10.1.1.2 and 192.168.200.254

So, on local computer A:
ssh -v -L 192.168.200.1:16124:50.40.30.20:16124 -p 50522 larrson@88.33.88.33

On firewall I set:

$IPT -A FORWARD -d 88.33.88.33 -m state --state NEW -p tcp --dport 50522 -o $EXTERNAL_ETH -j ACCEPT

and everything works OK until ftp client start passive mode. As I can see in the log file, additional high ports are opened and of course they are blocked by iptables.
I though that all traffic going only by ssh tunnel. Could someone, please, explain to me whats going on?

Kind regards,
Thomas


