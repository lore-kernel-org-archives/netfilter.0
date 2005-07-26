From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Tue, 26 Jul 2005 08:18:08 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507260816210.26583@yvahk01.tjqt.qr>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<429F4F47.8050301@riverviewtech.net>
	<42E5406D.9080406@SCampbell.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E5406D.9080406@SCampbell.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven M Campbell <Netfilter@SCampbell.net>
Cc: iptables <netfilter@lists.netfilter.org>, "Taylor,
	Grant" <gtaylor@riverviewtech.net>

Hi,


a general note on SSH rate limiting:
because someone might try [ multiple passwords for one given user ] per 
connection, it would be wise to use MaxAuthTries 1 in the sshd config file so 
that every password test requires a new connection, and therefore undergoes 
the "real" limit. I currently have MaxAuthTries 2 and it's not working bad 
either.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

