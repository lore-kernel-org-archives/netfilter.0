From: Reed Wiedower <rwiedower@peyser.com>
Subject: DNS question
Date: Thu, 6 Feb 2003 10:21:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <211E94403B74D211878A0008C71C74DC60DD2E@ip216-50-5-162.z5-50-216.customer.algx.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I'm having some trouble with DNS queries making it through the filters...if
I allow connections out to use udp port 53, that should allow clients inside
the firewall to query external dns servers for information, correct? Do I
need to open any other ports? (Of course, I have "related, established"
open, so I assume the DNS server response will work properly). Am I missing
somthing?

end of line,

Reed


reed wiedower
reed.wiedower@peyser.com
peyser.com
202.638.3730x115


