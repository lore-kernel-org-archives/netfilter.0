From: Myles Uyema <mlists@uyema.net>
Subject: Re: How to block the real IP rather than an entire proxy?
Date: Tue, 13 May 2003 20:05:45 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305132003290.13227-100000@marx.gruntwerk.net>
References: <Law15-F579atA2PrCsP0001d012@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law15-F579atA2PrCsP0001d012@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J and T <j_and_t@hotmail.com>
Cc: netfilter@lists.netfilter.org

It's the job of the proxy to block out the offender.  There's nothing you 
can do with netfilter to prevent him from accessing your website through 
other proxies.

On Tue, 13 May 2003, J and T wrote:

My question is about blocking IPs from my network. It's a piece of cake to 
block static IPs. But there are times when someone sitting behind a proxy 
whos IP doesn't change, but the proxy in which he is accessing us does. 
There's no way I can figure out how to keep these people out. For example; 
Apache only shows the IP of the visitor and not the real IP of the visitor. 
Here's an example of what I mean using environment variables:

$ENV{'REMOTE_ADDR'};

One might believe this is the IP of the visitor. But...

$ENV{'HTTP_X_FORWARDED_FOR'}

if the above is present it is most likely the true IP of the visitor and the 
"REMOTE_ADDR" is just the proxy in which they are accessing the Net with.

$ENV{'HTTP_CLIENT_IP'}

Which you may need to deal with as well.

So how can I block a visitor who is jumping around through proxies? I don't 
want to block out the proxy as this could ultimately block out all AOL users 
for example.

Thanks!
John

_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail




