From: Tom Sullivan <TPSullivan@Cox.NET>
Subject: Re: Sharing Limited Internet Connection
Date: Fri, 02 Sep 2005 11:02:22 -0400
Message-ID: <6.1.2.0.2.20050902102711.01db2a28@pop.east.cox.net>
References: <025601c5afe2$21c119a0$0200a8c0@etpi>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <025601c5afe2$21c119a0$0200a8c0@etpi>
References: <025601c5afe2$21c119a0$0200a8c0@etpi>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: TestMail <testmail@peterpaul.com.ph>, "lists.netfilter.org" <netfilter@lists.netfilter.org>


>My ISP said i can only connect 1 PC in my DSL account (is this true????).
You'd have to read the user agreement with your ISP to see what the rules 
are for attaching computers to their network.

>If it is not true how can i share it using iptables???

The basics: Your "one" PC can be a Linux box with two NICs; one attached to 
your ISP and the other attached to hub or a switch on the inside of your 
home network.  That box would be your gateway and firewall for the rest of 
the computers on your home network.  If you're very new to Linux and the 
concepts of setting up a home network I would suggest using an "off the 
shelf" solution first, until you get better acquainted with Linux, 
IPTables, and all such related stuff.

There are many off the shelf solutions out there and I'm sure many people 
will suggest a wide range of options.  However, I would suggest IPCop 
[http://www.ipcop.org/] because I know it's pretty simple to set up.  I 
don't run it but I know people who do and they like it.

You can search Google: http://www.google.com/search?hl=en&q=linux+firewalls
and 
SourceForge:  http://sourceforge.net/search/?type_of_search=soft&words=firewall

Good luck with setting up your home network.

V/R,

-TOM




