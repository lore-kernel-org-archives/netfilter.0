From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: string is not working, any help?
Date: Wed, 11 Jun 2003 09:31:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030611163132.91227.qmail@web40207.mail.yahoo.com>
References: <3EE682F0.60800@iprimus.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EE682F0.60800@iprimus.com.au>
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
To: IPtables Users <netfilter@lists.samba.org>


--- Michael Kearey <mutk@iprimus.com.au> wrote:
> Esteban wrote:
> <snip>
> > root@dejawu:~# iptables -t mangle -A PREROUTING -p tcp -m --string
> > "pepee" -j DROP
> > iptables v1.2.7a: Couldn't load match
> > `--string':/lib/iptables/libipt_--string.so: 
> 
> The clue is above. You don't have 'so' called libipt_--string, it's 
> called libipt_string.so
> 
> >cannot open shared object
> > file: No such file or directory
> > 
> > Try `iptables -h' or 'iptables --help' for more information.
> > 
> > why is not working --string match??
> > im using pom version patch-o-matic-20030107 under 2.4.20 kernel.
> 
> The correct syntax is :
> 
> iptables -t mangle -A PREROUTING -p tcp -m string "pepee" -j DROP
> 
> Cheers,
> Michael
> 
> 
no offence Michael but I think you are wrong

it's -m string --string "string to match"

Cheers
John

=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com

