From: Spam User <spam@the-force.net>
Subject: RE: stop accepting new connections on port 80
Date: Wed, 7 Dec 2005 14:18:12 -0800 (PST)
Message-ID: <20051207140828.H66917@uberwoo.hedgpeth.com>
References: <FAC4E024BF776842876169173CE2F01313B3C4@mailbox.vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B3C4@mailbox.vikus.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



On Wed, 7 Dec 2005, Derick Anderson wrote:

>
>> -----Original Message-----
>> From: netfilter-bounces@lists.netfilter.org
>> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Spam User
>> Sent: Wednesday, December 07, 2005 3:39 PM
>> To: netfilter@lists.netfilter.org
>> Subject: stop accepting new connections on port 80
>>
>> Hi,
>>
>> I've been trying to figure out how to get iptables to stop
>> accepting new connections on port 80 while letting the
>> existing connections finish up what they're doing.
>>
>> I thought it would be as easy as removing the rule that
>> allows new connections and leaving the rule that allowed
>> related and established connections, but when I remove the
>> rule that allows new connections, all connections stop working.
>
> [snip]
>
> I don't know exactly how you're determining the above: is it a long
> download that gets killed? HTTP opens at least (and usually only) one
> connection per page so the problem may be that the connection is already
> closed even though the page is still being viewed. Unless you are
> downloading something it's not likely your connection will last much
> longer than four or five seconds on a heavily graphical page with
> broadband.


I had sort of thought about this, but then I thought thats what the 
related and established rules took care of.

I suppose it it would be more helpful if the end goal was known.. to be 
more specific, I should have included that we use PHP sessions and what 
I'd like to do is keep the session open until all the currently open PHP 
sessions are closed (serve active session, don't accept new connections).

I was hoping that the connection tracking would be associated to the 
sessions (not by session id or anything, but by the relationship of the 
established connections from the caller), so if user a looked at page X 
then 10 seconds later looked at page y, netfilter would know because that 
client had had established connections - I suppose I can see the flaws in 
that logic though.  I thought that the callers connection info being in a 
time_wait state would possibly mean something to iptables.

I know this isnt an apache/php list, but maybe thats where I should be 
headed?  Something like sending apache a usr1 signal, but instead of 
accepting new connections with the new config, just don't accept new 
connections until the daemon is restarted.

In any case, thanks for your speedy response.

>
> Your rules look ok at first glance so I would recommend some time with
> Ethereal and a long download from the web server. Download a big file
> once with your default rules and see what happens. Then delete the file
> and download it again, this time running your kill-new-connections
> script and see if the file transfer gets knocked immediately.
>
>> Thanks,
>>
>> Mike
>
> Derick Anderson
>
>

