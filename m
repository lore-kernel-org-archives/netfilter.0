From: Krishna <Krishna_shekhar@vsnl.net>
Subject: Re: How to block Yahoo Messenger through IP Tables
Date: 05 Oct 2002 05:00:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033808433.2973.4.camel@localhost.localdomain>
References: <20021005155955.65569.qmail@web40205.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021005155955.65569.qmail@web40205.mail.yahoo.com>
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

Hi,

    But why do you want to do that? If you want to block a particular
port then either disable it in inetd or xinetd. Or make rules 
for that destination port to DROP packets.


regards
Krishna

Krishna Shekhar
Network Administrator
Wiplash Wireless

On Sat, 2002-10-05 at 11:59, Alok Shukla wrote:
> Hi ,
> 
> Sorry for asking this newbie question first.
> 
> I am running a network with a Linux Server as a
> gateway. I am using IPtables as to masquerade internal
> IPs for Internet usage. I want to block the uses of my
> intranet for using yahoo messenger. I needed help for
> this. In general i wanted to know how to block a
> particular port.
> 
> Thanks in Advance
> 
> Alok Shukla
> 
> __________________________________________________
> Do you Yahoo!?
> Faith Hill - Exclusive Performances, Videos & More
> http://faith.yahoo.com
> 




