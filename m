From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: DNAT confusion
Date: Thu, 31 Jul 2003 20:51:30 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDCECNNFAA.georgev@citadelcomputer.com.au>
References: <3F28F02A.3070705@belfordhk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F28F02A.3070705@belfordhk.com>
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
To: cc <cc@belfordhk.com>, Netfilter Group <netfilter@lists.netfilter.org>

$IPTABLES -t nat -A POSTROUTING -p tcp -d $HTTP_IP --dport 80 \
           -j SNAT --to-source $FIREWAL_INT_IP

You should specify -s $INTLANSUBNET/24 on this line to prevent it activating
for external visitors..

also, use -i -o where possible as it'll catch the correct packets going to
the right place..

RESULT:

# for external visitor DNATing.
$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp -d $EXT_IP \
          --dport 80 -j DNAT --to $HTTP_IP

# Bucket passing
$IPTABLES -A FORWARD -p tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 80 -m state --state ESTABLISHED -j
ACCEPT # think this is needed.

# for internal visitor SNATing.
$IPTABLES -t nat -A POSTROUTING -s $INTSUBNET -p tcp -o $INTDEV -d
$HTTP_IP --dport 80 \
           -j SNAT --to-source $FIREWAL_INT_IP

I think that's about it.. ;)


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of cc
Sent: Thursday, July 31, 2003 8:32 PM
To: Netfilter Group
Subject: DNAT confusion


Hi,

I should've asked this question in my previous post.  I'm using
Linux 2.4.20  (should be patching it to 21 soon).

Right now, I have :

$IPTABLES -t nat -A PREROUTING -p tcp -d $EXT_IP \
          --dport 80 -j DNAT --to $HTTP_IP

$IPTABLES -A FORWARD -p tcp --dport 80 -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -p tcp -d $HTTP_IP --dport 80 \
           -j SNAT --to-source $FIREWAL_INT_IP

Right now, I can access the Internet from within the LAN.
The problem is when I try to use the FQDN (www.mydomain.net)
to access my webserver.  I know that I've hit the exact
hurdle as mentioned within the iptables tutorial.  But
the problem is, I have included the tutorial's suggestion of
adding that POSTROUTING rule in.

I had it working before, but the problem i had with
it working (*grin*) was that the web server wasn't logging
the EXT_IP's IP, but rather my firewall's internal IP.

I don't remember how I got it working before, so I'm
stuck with a dilemna.  Should I allow FQDN references
for local users (and having the web server log packets
originating from the firewall) or should I disallow FQDN
(and having the webserver log the actual IPs).

Is there a way for me to have the best of both worlds?

Now I'm not sure if the last remaining 'rule' given in
the DNAT section is the clincher, but since I'm getting
an invalid argument (and still am searching for the
pom patch for it), I'm not able to use that third rule.

Any help appreciated

Edmund

--
email: cc@belfordhk.com  | "A man who knows not where he goes,
                         |  knows not when he arrives."
                         |                - Anon



** All information contained in this email is strictly     **
** confidential and may be used by the intended receipient **
** only.                                                   **



