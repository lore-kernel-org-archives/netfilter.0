From: aksingh@hss.hns.com
Subject: NF_IP_LOCAL_OUT
Date: Wed, 21 Apr 2004 10:02:46 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFF002E97E.E621AC9C-ON65256E7D.001892FA@hss.hns.com>
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
To: "Jee J.Z." <jz105@york.ac.uk>, Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org





hi

  I had doubt using this "NF_IP_LOCAL_OUT" netfilter hook, do all locally
generated packets hit this hook first ? .. i.e a packet comes from
application running on this machine, goes to TCP , then comes to ip... or
say a normal TCP ack going out from this machine ... so would all such
"locally generated" packets hit this hook first ? and is the routing
decision for such packets taken after they traverse this hook ?

thanks
Amit

"DISCLAIMER: This message is proprietary to Hughes Software Systems Limited
(HSS) and is intended solely for the use of the individual to whom it is
addressed. It may contain  privileged or confidential information and
should not be circulated or used for any purpose other than for what it is
intended. If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient, you are
notified that you are strictly prohibited from using, copying, altering, or
disclosing the contents of this message. HSS accepts no responsibility for
loss or damage arising from the use of the information transmitted by this
email including damage from virus."


