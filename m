From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: Logging back!
Date: Sun, 24 Aug 2003 14:19:18 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308241419.18830.fabrice@netfilter.org>
References: <000001c36991$b9f23ae0$fb09a8c0@viper11>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c36991$b9f23ae0$fb09a8c0@viper11>
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


Hello,

On Sunday 24 August 2003 00:15, Ray Anderson wrote:
> Forgive the double post (if any).  I originally sent this from my
> non-subscribed account.
> I have a RedHat 9 machine, and  as I stated on this list before, I had
> fixed the console logging by adding -c 3 to the KLOGD options in BOTH
> /etc/sysconfig/syslog AND /etc/rc.d/init.d/syslog.  (Thanks Brian)
> This worked great up until I upgraded to the latest kernel (2.4.20-20.9).
> Now all console spewing has returned.
> Any suggestions?

You can ask dmesg to ask the console to shut up, or to ask to to log
less. On mandrake, there's a dmesg -n 1 ran at the rc.sysinit stage.
Man page of dmesg should help you.

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown


