From: Silkk <crystaldrinker@yahoo.com>
Subject: Re: iptables does not support chkconfig!
Date: Sun, 22 Dec 2002 23:01:19 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021223070119.2289.qmail@web40610.mail.yahoo.com>
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

I looked in 
/sbin/   for iptables and nothing soo i did whereis iptables
/usr/local/sbin/iptables  /usr/local/lib/iptables

Im not sure where the iptables executable file went?
casue in  
/usr/local/sbin/iptables i tryed to veiw that file using vi 
and it is a special chractors like
&8$#  
soo is that the file i need? 




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

