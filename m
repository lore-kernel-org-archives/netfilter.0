From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 14:16:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009f01c45464$f3179bd0$1201a8c0@admin>
References: <20040617110325.97064.qmail@web14723.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

> What is this FTP module and how to insert it? 

ip_conntrack_ftp
ip_nat_ftp

# modprobe ip_<conntrack|nat>_ftp


Gr,
Rob


