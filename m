From: aksingh@hss.hns.com
Subject: libipq speed
Date: Tue, 20 Apr 2004 15:01:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFB36523E3.68912DA0-ON65256E7C.00336D2F@hss.hns.com>
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
To: netfilter@lists.netfilter.org





Hi

    On  many links regarding user space hanlding of packets I have read
warnings about using libipq, speed wise .... "do this only if u dont want
ultra high speeds and all" ... this speed issue arises because we need to
copy things from kernel space to usr space and vice versa, or is there any
other reason for this. I mean suppose i want to make a process that gets
the packets from the kernel and plays with them and then reinjects them
into the kernel( my process has to be in user space) ... keeping this
constraint in mind (the process that tinkers with the packets has to be in
user space), is there any faster solution than using libipq i.e do these
warnings just mean that using libipq gives slower results when if packet
mangling is done in the kernel space itself .. which is quite obvious, or
do they mean that we can have better ways(faster) than libipq for user
space packet mangling.

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


