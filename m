From: ricp@ricp.net
Subject: Load Balance using SNAT or nth?
Date: Sun,  1 Dec 2002 23:37:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038803835.3deae37b42c91@webmail.ricp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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



Hello,

I have a box that with one WAN interface (T-1) that is my router and DNS 
currently. I'm adding a Second T-1 and I am planning on the best way to "load 
balance" between the Wan connections.


My first thought was to have a cronjob to change the SNAT rule for new 
connections periodicly but to me this has a couple of problems.

1) is based on time not on traffic
2) I'm not sure what will happen to ESTABLISHED connections.. I haven't 
experimented yet (New T isn't in), but I'm assuming that if I change the SNAT 
address on NEW connections.. any ESTABLISHED connections will be maintained to 
their normal termination(?).


I then found the Nth extension, and it appears to be exactly what I am looking 
for.


I would appreciate any comments on my SNAT idea or any information on your 
experience with the Nth extension.


TIA,
Ric

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/

