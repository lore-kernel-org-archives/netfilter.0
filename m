From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: to use or not to use stateful capabilities
Date: Mon, 5 Apr 2004 12:06:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051206.23643.Antony@Soft-Solutions.co.uk>
References: <23450.1081162773@zworg.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <23450.1081162773@zworg.com>
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

On Monday 05 April 2004 11:59 am, __ Radien__ wrote:

> here is just the table and may not be viewed well in my last post:

Okay, thanks, here are my comments on just the table again, since it is much 
easier to read now :)

> Conn.State   -s         -d         --proto   -sport  -dport   SYN   ACK
>
> New          out        web_server  tcp       <1024  80       Yes   No
> Established  web_server out         tcp       80     <1024    Yes   No

That should be "Yes Yes" at the end, I think.

> Established  out        web_server  tcp       <1024  80       No    Yes
> Established  web_server out         tcp       80     <1024    No    Yes

All the client connections are shown as using ports <1024 - that should be 
"usually >1024", but even that isn't a certainty.   You should allow for 
clients using any port number at all.

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


