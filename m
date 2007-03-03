From: "afshin lamei" <afshinlamei@gmail.com>
Subject: TCP Flags combination
Date: Sat, 3 Mar 2007 19:42:55 +0330
Message-ID: <3115d56e0703030812l24187a2we154e60971de81f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=red+P0JTI7AiGqNpcAkwqFu5XKO3lXtDiwRRLQRT3iaw9M7gJI4YA023h8QUbLKKCCLo3bgtlmPi/g1W5nUwaj10zS31iOnUR9eb5lLsB9GGh4IMUS2Eb70sPgwKdygQcAS8IY0IkcOub6Km03ko171/bWvHj+pgm3awJog9/bQ=
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear list,
I'm running a test box with an iptables rule like this (to detect "FIN
no ACK" port scanning):

iptables -A INPUT -p tcp --tcp-flags FIN,ACK FIN -j LOG

is that a correct rule for "FIN no ACK" scan?
The rule generates more than 15 log entries per minute in my /var/log/messages:

IN=br0 OUT= PHYSIN=eth1 MAC=<"my box" SRC=<"Some valid IPs" DST="My
box" LEN=52 TOS=0x00 PREC=0x00 TTL=40 ID=59216 DF PROTO=TCP SPT=59005
DPT=3128 WINDOW=65535 RES=0x00 FIN URGP=0

The logs are continuing to appear for more than 2 weeks! How can I
find the cause of this?
best regards,
afshin lamei

