From: cc <cc@belfordhk.com>
Subject: DNAT confusion
Date: Thu, 31 Jul 2003 18:32:10 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F28F02A.3070705@belfordhk.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1059647722-140-306"
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
To: Netfilter Group <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format...

------------=_1059647722-140-306
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

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


------------=_1059647722-140-306--

