From: Stef Coene <stef.coene@docum.org>
Subject: Re: [LARTC] Performanace fo the Iptables Server
Date: Wed, 27 Aug 2003 19:41:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308271941.53445.stef.coene__44961.9350758896$1062302257@docum.org>
References: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall> <200308271917.00121.stef.coene@docum.org> <015d01c36cc1$11fbabe0$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <015d01c36cc1$11fbabe0$c2bf09ca@Housecall>
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
To: hare ram <hareram@sol.net.in>, netfilter@lists.samba.org
Cc: lartc@mailman.ds9a.nl

On Wednesday 27 August 2003 19:31, hare ram wrote:
> Hi Stef
>
> How about Source and Desitination port, and protocol wise bytes transfer (
> like http, ftp, icmp, udp), if i want to track.
>
> next limitation, if the Server goes down, the traffic will be zero, that
> will be another Limitation
Not true.  If you record the counters each 5 minutes, you loose max 5 minutes 
of counters.  You can record the difference between the 2 reads and discard 
negative values.

> If i send the all the traffic to Mysql, so i can get the old data to.
>
> may be you can correct me if, i may be wrong thinking
>
> correct me with the best methods to do
If you really want it very detailed (src/dst - address/port), you indeed have 
to log it to mysql or so.
You can calulcate the number of updates you have to do mysql and simulate this 
on a test box.

Stef

-- 

stef.coene@docum.org
 "Using Linux as bandwidth manager"
     http://www.docum.org/
     #lartc @ irc.oftc.net


