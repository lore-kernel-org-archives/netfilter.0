From: jose nuno neto <jose.neto@liber4e.com>
Subject: RE: FTP SERVER ACCESS ( IPT_UNCLEAN PROBLEM?)
Date: Mon, 27 Oct 2003 16:00:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067270459.3020.94.camel@janis>
References: <LFEHKEBEBHAFGJBMNKAOKEJFCDAA.markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LFEHKEBEBHAFGJBMNKAOKEJFCDAA.markee@bandwidthco.com>
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
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org

Thanxs for your help,

I've dig into the /var/log/messages and found this message everytime i
tried to connect to the ftp server(it the same as the firewall)

Oct 27 16:22:41 bob kernel: ipt_unclean: TCP option 8 after end

Did this: tcpdump dst port ftp

16:22:41.317744 213.22.184.162.1844 > bob.liber4e.com.ftp: S
2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)
16:22:44.316286 213.22.184.162.1844 > bob.liber4e.com.ftp: S
2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)
16:22:50.301330 213.22.184.162.1844 > bob.liber4e.com.ftp: S
2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)
16:23:02.313601 213.22.184.162.1844 > bob.liber4e.com.ftp: S
2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)

But i dont understand nothing of this, do u?

I've found the UN_CLEAN chain from the iptables script and commented it
and now ftp works :-)

# Block (inbound) Traffic w/ Incorrect Flags
#$IPT -N IN_UNCLEAN
#$IPT -t filter -I INPUT -i $IF -m unclean -j IN_UNCLEAN
#$IPT -t filter -I IN_UNCLEAN -j LOG --log-prefix "** UNCLEAN ** "
#$IPT -t filter -I IN_UNCLEAN -j UNCLEAN

But i dont figured out what was happenning....
/var/log/messages also shoes this:
Oct 27 16:24:00 bob kernel: device eth0 entered promiscuous mode
Oct 27 16:24:26 bob kernel: device eth0 left promiscuous mode

Any clues on what happened?


-- 
Best Regards,

Jose' Nuno Neto
TLM: 00 351 96 2808587


