From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Re: iptables problem (nfcan: addressed to exclusive
	(nfcan: addressed to exclusive sender for this address)
	(nfcan: addressed to exclusive sender for this
	address)	sender for this address)
Date: Fri, 4 Nov 2005 00:00:32 -0500
Message-ID: <20051104050032.GS14687@salty>
References: <20051103062533.C48C96AA57@smtp.sterenborg.info>
	<4369B1F2.50804@pcraft.com> <20051103152158.GA14687@salty>
	<436A34B2.1080909@pcraft.com> <20051103170032.GE14687@salty>
	<436A6B94.6070305@pcraft.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <436A6B94.6070305@pcraft.com> (from
	+nfcan+jimlaur+656ad77fee.ashley#pcraft.com@spamgourmet.com on
	Thu, Nov 03, 2005 at 14:57:08 -0500)
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.11.03 14:57, Ashley M. Kirchner - ashley@pcraft.com wrote:
> Jim Laurino wrote:
>
...
>    I just got off the phone with the company and they made a small change in  
> our config.  Now, all the kiosks have to do is connect via FTP to their  
> server and drop a file.  That's it.  Nothing comes back, no inbound  
> connections to the kiosks.  Just going out.
> 
>    So, just out of curiosity, I decided to try doing a manual FTP transfer  
> from a completely different machine on the network.  One that CAN connect to  
> external ftp sites just fine and transfer files.  And this is what I see:
> 
>    - Open DOS window
>    - Connect to FTP server
>    - enter 'PUT file.xml' command
>    ...and that's where it hangs.
>
....
> 
>    Please remember that this is a machine onto which I CAN open an ftp  
> connection to anywhere in the world and be able to send and receive files  
> just fine.  So then why is it not working when going to these people?
> 
>    ---- FIVE MINUTES LATER ----
> 
>    I just tried directly from the firewall machine and found out they don't  
> allow PASSIVE mode ON... As soon as I turn passive mode off, the transfer,  
> FROM THE FIREWALL MACHINE, works.  (firewall machine has an external IP)
> 
>    So now I wonder, is it because of the passive mode setting they have?   
> Could that be why ftp transfers from within the firewall fails?
>

non-passive (active) FTP requires that
the outside ftp server be able to open
a secondary connection to the client.
That is why passive mode is so popular
when the ftp client is behind a firewall -
both of the connections are originated from the client,
and no ports have to be opened on the firewall
for the incoming secondary connection.

I was confused about this earlier,
and may have contributed to the confusion.

A clear explanation is here http://slacksite.com/other/ftp.html

So, it is possible that your firewall is not configured to allow
active mode ftp connections. (But it can be done).

HTH

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

