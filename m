From: "yomega" <yomega@wahooo.net>
Subject: OK the last one: IP Accounting
Date: Sun, 23 Jun 2002 09:35:58 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <NFBBLDBMIDIOFPBNLEAJOEKCCHAA.yomega@wahooo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi List,

sorry 4 bothering you once again :) But tonight in my nice and warm little
bed my IP-Traffic Accounting Question Brain stood up once again :)

For Example, i wanna count the Traffic of my HTTPD so its only Port 80, not
other HTTPS Stuff or such its just an easy one :) Now my thoughts:

1. I Add a chain, httpd_accounting
2. I Add a rule @ httpd_accounting on port 80, no matter if its Input or
Ouput just this:

iptables -A httpd_accounting -p tcp --dport 80

2. At the Input Chain i add an Rule for Port 80 that Jumps to
httpd_accounting

iptables -A INPUT -p tcp --dport 80 -j httpd_accounting

So my INPUT traffic is now ready 4 counting.

3. Now the Output Traffic has to be counted, same thing but:

iptables -A OUTPUT -p tcp --dport 80 -j httpd_accounting

Now I'm finished !!?

You think this is OK? Or do I count some traffic twice? And, of course, have
i counted ALL the traffic?

Thx 4 all nice ppl reading my stupid question :o)

Greetz,
yomega


