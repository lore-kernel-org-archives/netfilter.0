From: "Patrick Ahler" <patrick@vikus.com>
Subject: more fun with squid
Date: Fri, 9 May 2003 15:49:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFOEPICAAA.patrick@vikus.com>
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
To: netfilter EMAIL <netfilter@lists.netfilter.org>

Ok, I got squid working great behind my firewall even set it up so IE would
autodetect it. What I would rather do though is have netfilter/the firewall
server(192.168.1.a) forward any http packets from my network 192.168.1.0 to
the proxy server on 192.168.1.b and then out to the internet through the
firewall(192.168.1.a). That way the proxy would be transparent to the users'
browsers and no autodetection would be required. Not sure how to setup these
rules, or if this is even the most efficient way of accomplishing the task.
Also, I don't know if it makes a difference... but the firewall runs NAT
tables.

So, in other words, this is what I'd like to do...
(user)192.168.1.c --->(firewall)192.168.1.a--->(squid/proxy)192.168.1.b--->(
firewall)192.168.1.a

Thanks in advance,
-Patrick



