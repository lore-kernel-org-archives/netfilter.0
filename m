From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Invalid friggen argument
Date: Sun, 12 Oct 2003 10:44:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
References: <200310120141.15894.Herman@AerospaceSoftware.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200310120141.15894.Herman@AerospaceSoftware.com>
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
To: Herman@AerospaceSoftware.com, netfilter@lists.netfilter.org

I don't think you have a versioning problem.  Some of the more recent
releases of netfilter are more sensitive about arguments and argument
ordering I have found.  Are you able to slip in a destination address into
that rule:

iptables -t nat -A PREROUTING -i eth1 -p tcp -d xxx.xxx.xxx.xxx --dport 6390
\
 -j DNAT --to 192.168.10.245

It may be looking for a dest address.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Herman
Sent: Sunday, October 12, 2003 12:41 AM
To: netfilter@lists.netfilter.org
Subject: Invalid friggen argument


Hi everybody,

I am trying to get port forwarding to work.  I had it working some time ago
gawdknows what changed...

Now, I get this result with iptables 1.2.7a-2mdk and with 1.2.9rc1:

# iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 6390 \
 -j DNAT --to 192.168.10.245
iptables: Invalid argument

I can cut and paste a line from a howto and I still get 'invalid argument' -
grrr...

Any ideas?

Cheers
--
Herman



