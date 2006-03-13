From: Marc Kalberer <Marc.Kalberer@programmers.ch>
Subject: Iptables NAT & vserver
Date: Mon, 13 Mar 2006 16:57:47 +0100
Message-ID: <4415967B.3040002@programmers.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
I tried to setup a subnetwork using several vservers.

- host system is connected to internet
- several guest in a different subnetwork on it.
- the host has the normal eth0 interface and a "virtual" tap0 one.
- host can see and connect both network.

Now the "problem" is :
- from outside I have several subdomain test.example.com,
test2.example.com pointing on the guest ip.

and base on the name I would like to redirect de incoming connection too
the corresponding guest.
iptables is suppose to handle the -d <hostname>

(host is 10.0.0.160)

-A PREROUTING -p tcp -m tcp -d test.example.com -j DNAT --to-destination
10.0.1.2

... what's wrong with my approach, I didn't succeed to make it work.

Any Idea ?

Marc


-- 
Programmers.ch
Solutions libres et Opensources
Tel: ++41 76 44 888 72
Site: http://www.programmers.ch
Site: http://openprojects.ch

-- 
Programmers.ch
Solutions libres et Opensources
Tel: ++41 76 44 888 72
Site: http://www.programmers.ch
Site: http://openprojects.ch


