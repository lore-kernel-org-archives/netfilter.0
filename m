From: aksingh@hss.hns.com
Subject: ipq_read return values when timeout is specified
Date: Tue, 1 Jun 2004 12:06:25 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF79639C38.78EA339D-ON65256EA6.0023ED00@hss.hns.com>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org





Hi,

   Correct me if I am wrong, if I give -1 as the timeout parameter to
ipq_read, then ipq_read returns :

-1 incase of an error,
a +ve non zero value, if there was something to read
0 if there was nothing to read, or a non-blocked signal was caught .

Also, since I gave this -ve value as timeout parameter ipq_read would
return immediately if there was nothing to read .

regards
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


