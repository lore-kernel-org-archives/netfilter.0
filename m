From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: how to got  lasting time about one connection from iptable log?
Date: Wed, 4 Jun 2003 18:49:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030604104905.GE1477@floyd>
References: <E19NOOU-0001Jt-00@kashyyyk.netfilter.org>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E19NOOU-0001Jt-00@kashyyyk.netfilter.org>
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

On Wed, Jun 04, 2003 at 10:51:51AM +0800, gbj spoke thusly:
> time                      in   pro    src         spt      dest        dpt
>Jun 02 07:59:31   ACCEPT  eth0  tcp  192.168.6.26  4278  64.215.164.33  80  
>Jun 02 07:59:32   ACCEPT  eth0  tcp  192.168.6.26  4278  64.215.164.33  80  
>Jun 02 07:59:32   ACCEPT  eth0  tcp  192.168.6.26  4278  64.215.164.33  80  
>
>but in fact, this connection information perhaps belonge to one
>connection,I want to know how to combine this information to one
>connection message and got the duration time of the connection,just like

Really, HTTP/1.0 connection ?

>this: start  time        duration       src         spt     dest       dtp
>
>    Jun 02 07:59:30        128         192.168.6.26  4269  64.215.164.33
>    80 

You'll need to write a script to perform the calculations and joining for
you. 

Personally, from the above output, I think that would be quite easy, but
not entirely correct because I reckon you'll have to ignore the source
ports, or at least have some match going on, to determine that if your
start and end source ports are close enough, then they are part of the same
connection, if everything else (src, dst IP && dst port) are the same. [*]

[*] -- This of course also depends on the fact that you don't have any
       kernel patches (grsecurity comes to mind) which performs automatic
       randomization of the source port (ala OpenBSD).

(snip various bits)

