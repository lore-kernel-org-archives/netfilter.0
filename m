From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: (no subject)
Date: Wed, 05 Jun 2002 22:06:03 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GX900C6RQ648L@l-daemon>
References: <001401c20d05$a0103710$bb4110ac@ee>
 <00d301c20d12$0abbfde0$8201a8c0@adserver.local>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00d301c20d12$0abbfde0$8201a8c0@adserver.local>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Matt Walkowiak <matt@inetdvd.com>, netfilter@lists.samba.org

** Reply to message from Matt Walkowiak <matt@inetdvd.com> on Wed, 05 Jun 2002 23:24:25 -0500


> I was wondering if something exists that can do what I want for netfilter.
> 
> In the WatchGuard land, there is a very neat program called HostWatch.  It has two columns: One for Outside and one for Inside.  Then, it draws a line from one column to the other for each connection.  It also refreshes itself about once every second.
> 
> Let's say you have a web server on the inside of your firewall, and 10 people are currently hitting it.  HostWatch would show 10 lines (each from a seperate IP addy, resolved if it can find it) drawn to the one ip addy of the web server.
> 
> The nice thing about HostWatch is you can see exactly what is happening now.
> 
> Now, I generally dont run any kind of X-windows system on my Linux boxes, so it would be nice to get a "text based" version of what I'm looking for, however, if a nice program existed that needed X to run, I'd seriously consider installing X windows.
> 
> Anyway, thanks in advance for your responces!

Hey, Matt. Go to http://freshmeat.net and do a search for IPTSTATE. It is a top-like text based app that will monitor your connection state.

jb

-- 
Jack Bowling
mailto: jbinpg@shaw.ca

