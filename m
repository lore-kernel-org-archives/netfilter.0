From: "D. Prima Prayudi" <prima@arc.itb.ac.id>
Subject: Re: logging
Date: Tue, 6 Apr 2004 17:26:06 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.BSF.4.50L0.0404061723500.4748-100000@arc.itb.ac.id>
References: <web-273174035@mail01.infosat.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-273174035@mail01.infosat.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: IT Clown <iptables@mailbox.co.za>
Cc: netfilter@lists.netfilter.org


If you have difficulties with that I suggest you use ulogd daemon since
with syslogd the log from the kernel and iptables will be mixed-up.

Regards, D. Prima Prayudi

IPv6-enabled
ARC-ITB 2001:d30:3:160::2/64

On Thu, 1 Apr 2004, IT Clown wrote:

> Hi
>
> Thanks i googled abit and found something else but its
> logging to terminal and to a log file how do i get rid of
> the terminal logging? Apparently you have to remove
> anything like: /dev/console, "root" or '8' in syslog.conf
> and there is nothing like that in it.I added the following
> to syslog.conf:
>
> kern.* /var/log/iptables
>
> Regards
> __________________________________________________________________________
> http://www.webmail.co.za/dialup Webmail ISP - Cool Connection, Cool Price
>
>

