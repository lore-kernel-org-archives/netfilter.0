From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARD question
Date: Fri, 21 Nov 2003 11:34:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311211134.hALBYt724579@onyx.rockstone.co.uk>
References: <20031121104239.37088.qmail@web40804.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031121104239.37088.qmail@web40804.mail.yahoo.com>
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

On Friday 21 November 2003 10:42 am, Nick wrote:

> Thanks Antony, I got it. Once nat and conntrack
> helpers are implemented correctly, I don't have to
> worry about it anymore :-)
>
> There is one last thing, though(I promise it's the
> last one ;-)
>
> When I said that only port 21 is open I meant that on
> the router machine only this port accepts NEW client
> connections. The other ports will accept only
> ESTABLISHED and RELATED. I defined this in my INPUT
> rules.

I hope you didn't define them in INPUT :)   I hope you mean FORWARD!?

The INPUT chain is *only* used for packets which are addressed *to* the 
firewall machine itself - not for packets which are being routed through it 
to some other machine.   Those packets go through FORWARD.

> Do I need to accept NEW client connections to port 20
> as well ? I know it's used for active FTP and I
> thought FTP client never sends NEW to port 20, only
> ESTABLISHED.

No, packets coming in on port 20 as part of an ective FTP connection will 
count as RELATED.

That's the magic of protocol helpers :)

Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III
                                                     Please reply to the list;
                                                           please don't CC me.

