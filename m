From: Andre Lorenz <andre@highsecure.de>
Subject: Re: ftp problem!
Date: Mon, 9 Jun 2003 12:09:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306091209.54832.andre@highsecure.de>
References: <20030608221235.92699.qmail@web11507.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030608221235.92699.qmail@web11507.mail.yahoo.com>
Content-Disposition: inline
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

Am Montag, 9. Juni 2003 00:12 schrieb Salman Ahmed:
> Hello,
>
> I am using iptalbes with kernel 2.4.7-10. I have configured IP Masquerading
> for my gateway server. I am having problem regarding ftp as my clients are
> not accessing ftp service.any suggestion would be admirable about how to
> access ftp on my server or onto the Internet?
>
> please help me..
>
> Salman
Hello,

I've some suggestions to you:

1. is your ftp-server working correct
	test: ftp localhost  --> try to login as user
2. load your ftp-kernel-module
	modprobe ip_conntrack_ftp
	modprobe ip_nat_ftp

3. lookup wether the modules are loaded correct at your firewall
	type: lsmod 

3.1 lookup at your ruleset you'll need:
	port 20,21 (ftp-data, ftp) for active ftp

4. test your ftp-connection through your firewall to your ftp-server

I hope this will help your
with friendly regards
andre


