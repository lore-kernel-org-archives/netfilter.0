From: Paul <gabaod@yahoo.com>
Subject: Re: Filtering Yahoo Messenger Port
Date: Sun, 4 May 2003 19:07:22 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030505020722.9147.qmail@web13508.mail.yahoo.com>
References: <006e01c3129f$79061e50$6400a8c0@homes>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006e01c3129f$79061e50$6400a8c0@homes>
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
To: Voltaire Pascual <voltaire@voltaire.servebeer.com>, netfilter@lists.netfilter.org

try blocking a certain destination..

ie i use scs.yahoo.com to connect to yahoo messenger,
there may be more out there, but just drop any packets
that may be trying to goto that destination.

--- Voltaire Pascual <voltaire@voltaire.servebeer.com>
wrote:
> Hi there... got one newbie question here. Just
> wondering how can i block yahoo messenger port using
> IP tables in my box. Clients using YM is behind this
> box.  YM is using all possible ports even port 80.
> 
> TIA
> /Voltaire


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

