From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Logging issue!
Date: Sun, 28 Dec 2003 10:26:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FEEF641.8020908@Loudoun-Fairfax.com>
References: <Pine.GSO.4.58.0312281236220.12664@peppar.cs.umu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0312281236220.12664@peppar.cs.umu.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Johan Cimen wrote:

>Hi!
>
>I want to log incomming packets at PREROUTING. Packets destinated to a
>specific port on my box and with UDP protocol. Informations within those
>packets that I am interested of is TOS and TTL fields.
>
>I have been looking at ulog-acctd using the ULOG target in iptables, but
>this daemon does not logg TOS and TTL.
>
>Using LOG target in iptables will logg my packets among other syslog
>information. Isn't it correct? I want a seperate file for my loggs.
>
>I have also been looking at syslogd, but this seems to be complicated.
>
>Is there a way that I can logg information using LOG/ULOG target to a
>specific file, where there will only be my selected information that I
>later can grep?
>  
>

Yes. An easy way to do this is to specify log level 'debug' and then 
modify syslog.conf to write debug entries to a separate file. Another 
way is to use a script to parse /var/log/messages directly pulling out 
the iptables entries. If you search the archives you should find several 
exchanges between myself and Chris Brenton where we describe our 
different approaches in some detail.

Jeff



