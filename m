From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: This rule doesn't work!...
Date: Wed, 12 Nov 2003 22:23:18 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311130623.hAD6N9oL003132@server5.bandwidthco.com>
References: <200311111945.01103.b.caruso@laposte.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311111945.01103.b.caruso@laposte.net>
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
To: 'caruso bruno' <b.caruso@laposte.net>, netfilter@lists.netfilter.org

I guess my question would be why are you using rate limiting on a spoofed
source IP address?  Why not take them all out.  I would set that rule up
first and get it working.  Then if you wanted to play around with limiting
(for what ever reason), then do that.  The LIMIT target can sometimes be
difficult to get it to do what you want it to do, or think it should do.  

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of caruso bruno
Sent: Tuesday, November 11, 2003 10:45 AM
To: netfilter@lists.netfilter.org
Subject: This rule doesn't work!...

Hi

I have seen recently that I had many attempt connection from source address
127.0.0.1, source port 80. 

I had theses rules in my list:
iptables -A INPUT -i ppp0 -s "127.0.0.0/8" -m limit --limit 30/m -j LOG
--log-prefix "iptable NO_ROUTABLE_ADDR "
iptables -A INPUT -i ppp0 -s "127.0.0.0/8" -j DROP

I haven't any log in syslog just for this rule otherwise everything goes
well. 
I don't understand why theses rules doesn't work.

Best regards

Bruno




