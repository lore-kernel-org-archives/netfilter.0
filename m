From: cc <cc@ns.kdtc.net>
Subject: local forwarding(?)
Date: Fri, 17 Jan 2003 19:15:19 +0800 (HKT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301171115.h0HBFJZC013763@ns.kdtc.net>
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

Hi,

I finally got the bridge working and so far, 
things look ok.  

From the outside, I can goto the website.  That's
no problem.  The problem is for local machines
going to http://www.mydomain.com/, the firewall
doesn't seem to be redirecting it properly.
LAN users have to use http://192.168.11.10/ to
access the website instead of the www.mydomain.com.

I understand that the actual ip address skips
the firewall and goes directly to the machine.
From my boss' point of view(totally ignorant
that 192.168.11.10 = www.mydomain.com), he
doesn't like that.  So I'm hoping that he
can access (locally) www.mydomain.com.

So far my firewall script (the lines pertaining
to the www port) is as follows:

$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 x.x.x.x \
      --dport 80 -j DNAT --to 192.168.10.11
$IPTABLES -A FORWARD -p tcp -i eth0 -d 192.168.10.11 \
      --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i eth0 --dport 80 -j DROP

(I'm not entirely sure about that last item.  It looks
strangely invalid...but I could be wrong.  I don't
even think I should have that there.. am I right?)

If all my LAN ips are of the 192.168.10.0 host, 
and the web server is 192.168.10.11, how do I
get the LAN clients to go to www.mydomain.com and
have the firewall redirect the packets to 192.168.10.11?

As you probably can figure out, I'm a little confused. 

Any help appreciated



