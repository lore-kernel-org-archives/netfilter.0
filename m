From: Matt Kotich <matt@yourhost.com>
Subject: Iptables issue with EPSV FTP
Date: Mon, 3 Nov 2003 14:45:17 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <659503E2-0E4F-11D8-9512-0050E425B26F@yourhost.com>
Mime-Version: 1.0 (Apple Message framework v606)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I'm running into some problems with FTP when I fire up my iptables on 
RedHat 7.3.. basically, here's what happens:

220 server.yourhost.com FTP server ready
Name (server.yourhost.com:matt): matt
331 Password required for matt.
Password:
230 User matt logged in.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
500 EPSV not understood
227 Entering Passive Mode (xxx,xxx,xxx,xxx,xxx,xx).
-------System hangs here until I Ctrl+C

This is using the CLI FTP in OS X 10.3 (it was happening since 10.2 
also) and we've received reports of it breaking Dreamweaver, also.

Here's the rules that we've set up for this server:

[root@srv08 root]# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     tcp  --  dns-server1  anywhere           tcp dpt:domain
ACCEPT     tcp  --  dns-server2  anywhere           tcp dpt:domain
ACCEPT     all  --  VLAN1  anywhere
ACCEPT     all  --  VLAN2  anywhere
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http
ACCEPT     tcp  --  anywhere             anywhere           tcp 
dpt:https

I can't figure out why these would break for just OS X, my only guess 
is that it doesn't like the EPSV, however, I thought the "sate 
RELATED,ESTABLISHED" would fix that.. i'd even tried adding a rule for 
allowing "! --syn" but that didn't help either... Any idea what I could 
be doing wrong here?

-- 

Matt Kotich
Yourhost.com CTO
email: (matt)(at)(yourhost).(com)
phone: 714.842.8511x125


