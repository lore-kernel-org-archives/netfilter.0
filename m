From: SBlaze <dagent.geo@yahoo.com>
Subject: Blocking Streaming Media (Was: Re: (no subject)..)
Date: Thu, 10 Jun 2004 14:37:43 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040610213743.34810.qmail@web61007.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: nf <netfilter@lists.netfilter.org>

I guess, blocking ports or defining ports to be allowed to users is not 
enough. Users are clever and smart from day to day. Once the originial and 
standard ports blocked by administrator, they use port forwarding sometimes 
to some kind of hosting server or dedicated server, and they still able to do 
music streaming.

If you checkout the greatest site, let say www.shoutcast.com, u can see lots 
of stations use port 80, it means connecting to radio stations would be the 
same as clients surfing to the web. 

I'm still thinking patch-o-matic STRING would be the best solustion for now ..

Regards,
Rio Martin.

Perhaps you missed the rest of my post? I only pointed out the yahoo support
page as a starting point. I wouldn't attack this from a port point of view
becuase that method would be hit and miss. Find where the music comes from and
block the ranges it comes from. I stated examples of this with the Yahoo
LaunchCAST streaming protocol. I don't know the structure of your network so it
is hard for me to say how to find the culprits. I also used a packet sniffer on
my network to find where the service was originalting. Stopping shoutcast maybe
a bit more difficult... I'll look into that as well...

=====
In the absence of order there will be chaos.


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

