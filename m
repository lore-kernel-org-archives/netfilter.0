From: Doug Monroe <doug@planetconnect.com>
Subject: Re: TCP delay, SMTP errors
Date: Mon, 10 Jun 2002 18:35:00 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D052994.CD0F1237@planetconnect.com>
References: <001601c210bf$d1a5fef0$2901a8c0@amos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Nathan Cassano <nathan@cjhunter.com>
Cc: netfilter@lists.samba.org

Nathan Cassano wrote:
> 
> Hi folks,
>         Our website (on an internal NAT'ed network) connects our email
> server (on an external network). The website uses a SMTP PHP class to
> send mail using socket connections. The problem is a delay in connecting
> to the mail server that causes the class to quit prematurely. I fixed
> the problem by adding a function call to sleep(1) after fsockopen() but
> this is a hack. Is there a better way to fix this TCP delay? I tried
> setting the TOS value to Minimize-Delay but I didn't see any difference.
> Any suggestions are welcome.

what happens when you use telnet from the website box to the mail server's
port 25? do you get a delay rec'ving the SMTP banner? Likely has nothing to do
with netfilter...my money's on a paranoid SMTP trying to do a reverse DNS
lookup (or identd?) causing the delay. Maybe there's no PTR record for the NAT
(public) IP of the website? Maybe your SMTP server has a big-ish list of DNS
hosts to try before it finally timesout?
--
Doug

