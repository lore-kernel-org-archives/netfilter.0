From: Silkk <crystaldrinker@yahoo.com>
Subject: Re: iptables does not support chkconfig!
Date: Mon, 23 Dec 2002 02:00:06 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021223100006.15714.qmail@web40602.mail.yahoo.com>
References: <200212230153.50801.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212230153.50801.netfilter@newkirk.us>
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

I tryed that and re-started 
#chkconfig 2345 80 30
And firewall script starts but the rules didnt run ...Sooo this is what i did im not sure
if it is the proper method but everything seems to be working:
i installed the latest iptables rpm package 
iptables-1.2.5.rpm and then rebooted and it worked? Could something go worng by doing
this if soo what could have been another method to fix it.




--- Joel Newkirk <netfilter@newkirk.us> wrote:
> On Monday 23 December 2002 01:26 am, Silkk wrote:
> > Here is the error message im getting i found it in /var/log/boot.log
> > firewall: /etc/rc3.d/s80 firewall: iptables: command not found
> > last message repeated 71 times
> 
> Try changing "iptables" to "/sbin/iptables" or whatever path it actually 
> lives on.  (that's the one for an RPM install under RedHat, I believe)  
> You can't count on a script having valid paths set up during the system 
> startup, play it safe and be explicit.
> 
> j
> 
> > __________________________________________________
> > Do you Yahoo!?
> 
> No, I don't... :^)


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

