From: /dev/rob0 <rob0@gmx.co.uk>
Subject: DNAT --to-destination: why not hostname?
Date: Wed, 3 Mar 2004 13:33:33 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403031333.33554.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

The syntax from TFM, iptables(8):
    --to-destination ipaddr[-ipaddr][:port-port]
Obviously if you are going to use a range of destinations only IP 
addresses would suffice. But why can't this option accept a hostname 
for a single destination?

This would be convenient for scripting, in that you maintain control of 
the firewall through DNS. As it is, to use a hostname I have to use an 
intermediate step to get the IP, like this:
    DEST_IP=`dig +short ${DEST_HOST}.domain.tld.`
This is also less than ideal because if iptables resolved the name 
itself, it would use the "search domain.tld" out of resolv.conf. For 
dig I have to manually append it. And it's REALLY inconvenient in some 
of my firewall machines where there is no BIND installed. It gets even 
worse in sites which aren't running their own DNS ... AFAIK dig and 
host only use DNS, not /etc/hosts, for resolving.

iptables DOES resolve hostnames used in other parameters, so why not 
here? That should have been a question for the developer list, I guess, 
but I'm not on that one.

But a good question for this list might be: "How have you handled this 
need in iptables scripting?" I have used the dig trick where available 
and hard-coded IP's elsewhere.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

