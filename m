From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: Re: Saving IPTable rules..oops
Date: Wed, 29 Dec 2004 13:23:43 -0500
Message-ID: <002501c4edd3$872fb6b0$0500a8c0@floydian>
References: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org, Jason Williams <jwilliams@courtesymortgage.com>

> Morning.

Afternoon.

> Well, spent a better part of the night playing with IPTables. Tried out 
> some rules, tweaked this, broke that. Was a lot of fun.
>
> Anyway, as I am getting ready to make one of my servers go live, I 
> realized something that I completely overlooked. Very important thing I 
> might add.
>
> Basically, once you put all your rules into IPTables via the command line, 
> how do you save your rules? I saw a command, iptables-save, but that just 
> outputs the rules in a readable format.
>
> I started thinking and came up with the following:
>
> 1) Does iptables read the init script in /etc/init.d/ upon bootup of a 
> server/box and use those rules for the system?

YES.

> or
>
> 2) Does it read a plain text file some where an use those rules instead?

YES. /etc/sysconfig/iptables

> wasn't quite sure and since im going on 22 hours without sleep, im 
> positive I missed it some where.
>
> With that in mind, was hoping someone could fill in the details.
>
> IF it is the case the the system reads the iptables init script upon 
> bootup/restart, that means I need to work on my scripting. :)
>
> Anyways, hoping for a little clarity here.
>
> Cheers,
>
>
> Jason


You can do couple of things:
- After you enter your commands from a shell, you can do a *service iptables 
save*. All the commands that you had entered will be stored in the 
*iptables* file in /etc/sysconfig. By the way this is the file the system 
reads while boot up to load the firewall configuration.
- You can directly edit this file to add new commands (though it is not 
recommended, but I still do it 'coz it makes life easier) and then run 
*iptables-restore* to load the new configuration.

Hope this helps.

Deepak Seshadri 


