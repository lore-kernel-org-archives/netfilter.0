From: Vladimir Mosgalin <mosgalin@VM10124.spb.edu>
Subject: Dynamic change of iptables (building Wi-Fi hotspot)
Date: Sun, 4 Jul 2004 20:33:42 +0400 (MSD)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0407042011460.3513@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello everybody.

I want to build a Wi-Fi hotspot. The linux box with wireless AP
connected to it which provides internet access to people with Wi-Fi
cards.

When people pay for time or traffic some unique username and password is
given to each. When they try to access any http website, for the first
time each of them gets a login message. After entering name & password,
they continue to work normally.

I see two ways of doing it.
1) Iptables get changed by some script each time when someone registers
or his time runs out. There is a rule
iptables -A FORWARD -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:80

Thus, everyone gets forwarded to localhost.
On localhost, apache has 404 error handler which redirects each to login
page. When they sucessfully enter username and password, script adds
line like this
iptables -I FORWARD 1 -s $ip -j ACCEPT
and now client can do whatever he wants.

When unregistering, another script removes this line.

I see two problems in this approach - I'm not sure whether changing
iptables constantly is good, and I feel a bit anxious about the fact
that several different scripts are running and doing something.

2) All traffic is redirected to tun interface, and some C program
analyzies each packed and decides whether to pass them or block them
and serve as a simple http server, offering login page. The problem is
that I need to write this program in this case, and it can be
complicated a bit, and I'm not very confident because all traffic
will have to pass through this program and it must be written really
good if I don't want to have problems.


Maybe there are other solutions (like very clever netfilter module which
can be controlled from userspace)? Or there is nothing bad in changing
iptables often?

-- 

Vladimir

