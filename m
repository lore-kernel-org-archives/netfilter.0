From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rules for DNS
Date: Thu, 29 Jan 2004 15:39:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401291539.16464.Antony@Soft-Solutions.co.uk>
References: <1075389910.2794.6.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075389910.2794.6.camel@dchws.TQMcube.com>
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
To: Iptables Mailing List <netfilter@lists.netfilter.org>

On Thursday 29 January 2004 3:25 pm, David C. Hart wrote:

> I am terribly confused about what I need to accept and reject and the
> associated IPTables rules for Bind to work properly without exposing our
> server to exploits. Right now, I'm pretty much accepting all traffic to
> and from port 53 and that's "probably" not a good thing. I'm running
> IPtables on the same machine running Bind.
>
> Can someone point me in the right direction?

Allow traffic to TCP & UDP ports 53 on your DNS server, but secure it in 
/etc/named.conf using the info at http://www.isc.org under BIND - hint: stop 
people from doing zone transfers or domain updates.

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


