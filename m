From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: port redirect for locally generated request
Date: Fri, 29 Aug 2003 20:33:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPMEPACHAA.markee@bandwidthco.com>
References: <000801c36e35$3f7cee60$8c01a8c0@RSUNDARAM>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c36e35$3f7cee60$8c01a8c0@RSUNDARAM>
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
To: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org

Use REDIRECT:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080

specify an interface if necessary.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Sundaram
Ramasamy
Sent: Friday, August 29, 2003 6:56 AM
To: netfilter@lists.netfilter.org
Subject: port redirect for localy generated request



Hi,

With this rule incoming request for port 80 redirected to port 8080. But
this is not working localy generated request.

iptables -t nat -A PREROUTING -p tcp --dport 80 -d LISTEN_IP -j DNAT --to
LISTEN_IP:80

How will i redirected local request port 80 to port 8080 ?

Thanks




