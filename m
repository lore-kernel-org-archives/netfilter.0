From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: Re: Saving IPTable rules..oops
Date: Thu, 30 Dec 2004 15:52:37 -0500
Message-ID: <002d01c4eeb1$7f6a1fe0$0500a8c0@floydian>
References: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com><002501c4edd3$872fb6b0$0500a8c0@floydian>
	<6.1.2.0.0.20041230123544.02691b78@corpmail.courtesymortgage.com>
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
To: Jason Williams <jwilliams@courtesymortgage.com>, netfilter@lists.netfilter.org

From: "Jason Williams" <jwilliams@courtesymortgage.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, December 30, 2004 3:39 PM
Subject: Re: Saving IPTable rules..oops


> At 10:23 AM 12/29/2004, you wrote:
>>You can do couple of things:
>>- After you enter your commands from a shell, you can do a *service 
>>iptables save*. All the commands that you had entered will be stored in 
>>the *iptables* file in /etc/sysconfig. By the way this is the file the 
>>system reads while boot up to load the firewall configuration.
>>- You can directly edit this file to add new commands (though it is not 
>>recommended, but I still do it 'coz it makes life easier) and then run 
>>*iptables-restore* to load the new configuration.
>
> Appreciate the help and feedback on this. Makes sense now.
> One queston regarding the /etc/sysconfig/iptables file. In this file, can 
> I put my variables in there? Such as: INET_IP=212.122.131.34, 
> INET_IFACE="eth0" and so forth?
> Or does that need to go somewhere else?

I don't think you can put your variables in /etc/sysconfig/iptables file. It 
follows a particular pattern which is not that difficult to learn.

If you want to use variables and stuff, you gotta write your own script file 
and run it at bootup. I use do this way when my firewall rules were less 
than 50 lines.

Now my firewall rules are more than 500 lines so I edit the 
/etc/sysconfig/iptables file directly. It is just an efficient way to load 
the rules through this file.

>>Hope this helps.
>>
>>Deepak Seshadri
>
> Thanks!
>
> Jason
>
> 


