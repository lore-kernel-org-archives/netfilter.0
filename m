From: "Patrick Ahler" <patrick@vikus.com>
Subject: ip_conntrack: max number of expected connections....
Date: Wed, 2 Jul 2003 10:24:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFMEICCIAA.patrick@vikus.com>
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

Got an error which cause all network traffic to slow down ALOT...


-------------------
ip_conntrack: max number of expected connections 1 of ftp reached for
xxx.xxx.xxx.xxx -> yyy.yyy.yyy.yyy, reusing
-------------------

xxx.xxx.xxx.xxx = public ip, not ours
yyy.yyy.yyy.yyy = our ftp-server

I'm not positive if that was the exact error message... unsure of what to
do... I decided to just restart the machine... and that fixed the problem.

Patrick




