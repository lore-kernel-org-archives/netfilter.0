From: Stef Coene <stef.coene@docum.org>
Subject: Re: [LARTC] Performanace fo the Iptables Server
Date: Wed, 27 Aug 2003 20:09:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308272009.03109.stef.coene__18451.9716691741$1062302953@docum.org>
References: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall> <200308271941.53445.stef.coene@docum.org> <026101c36cc3$b6b76280$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <026101c36cc3$b6b76280$c2bf09ca@Housecall>
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

On Wednesday 27 August 2003 19:50, hare ram wrote:
> Hi Stef
>
> Thats right, if i make cron job run every 5min, so i will loose only 5min
> of data.
>
> i was not understand
> " You can record the difference between the 2 reads and discard
> negative values. "
>
> you mean to say first 5min and next 5min bytes increasing ok
> if not i will discard and take new values you mean.
You can also store the difference between 2 readings.  Otherwise your counters 
will increase forever.

> If i make the log to mysql, so it will be 24hours right
> is there anything i can make every 5min dump the data to Mysql using ULOG
You can try to redirect the ULOG to a named pipe or a shell script.  

Named pipe example :
mkfifo test
echo 1 > test &
echo 2 > test 1
echo 3 > test &
cat test
3
2
1
[1]   Done                    echo 1 >test
[2]-  Done                    echo 2 >test
[3]+  Done                    echo 3 >test

So the numbers 1, 2 and 3 were cached in the named pipe untill the cat command 
was executed.

Stef

-- 

stef.coene@docum.org
 "Using Linux as bandwidth manager"
     http://www.docum.org/
     #lartc @ irc.oftc.net


