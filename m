From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Firewall setup at boot - trouble with setting up the LOG target
Date: Sat, 5 Jul 2003 20:50:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307052050.49797.Alistair@nerdnet.ca>
References: <7C9884991ADAE0479C14F10C858BCDF52E3554@alderaan.smgtec.com> <200307042233.46558.Alistair@nerdnet.ca> <n7vcgvs39brkp00l6atko40tdbbdld4sro@4ax.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <n7vcgvs39brkp00l6atko40tdbbdld4sro@4ax.com>
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
To: Michal Kepien <lordpopcorn@poczta.onet.pl>
Cc: netfilter@lists.netfilter.org

On July 5, 2003 03:30 am, Michal Kepien wrote:
> >	KERNEL_DIR=/xxx/xxxx/xxx ./configure --prefix=/
> >	                        ^^^^^^^^^^^^ being wherever your kernel source
> > code hides.
>
> You mean the source code dir (e.g. /usr/src/linux-2.4.19) or the
> config file (e.g. /usr/src/linux-2.4.19/.config)?
	That should be the directory where your current kernel source 
	cod e is .

>
> >	personally I have all my networking delayed until after I'm multiuser
> >	-- and then only the inside stuff gets started...
> >	*after* the box is up and stable I start the internet cruft and
> >	the firewall...
>
> You mean you start the firewall manually (i.e. it is not started
> automatically at boot time)?
>
	It is started automatically at boot time .. .I just keep the networking
	stuff including the firewall until all the processes that do NOT	
	absolutely require it are started ... including all the system monitoring
	and other daemons are started... 

	I did a *lot* of reading about my systems startup scripts to get this
	firing correctly ... 

> >	Simple expedience says that you should turn off forwarding
> >	very early in your startup scripts and then turn it on at the *end*
> >	of the firewall script.
>
> OK, I did it but what does it change? :)
>

	It makes sure that connections *through* your box are properly firewalled.
	-- I don't bring the ppp0 dsl interface (my internet connection) up until 
	after the policies are set to DROP .. but that's me being paranoid.

> Michal Kepien

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

