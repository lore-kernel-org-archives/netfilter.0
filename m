From: Rahul Jadhav <rahul@iatp.org>
Subject: Re: problems with nat
Date: Wed, 13 Nov 2002 14:01:15 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DD2AF8B.7030904@iatp.org>
References: <3DD29634.8000606@iatp.org> <1037215251.7329.2.camel@ben.mis.tnsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ben Russo <ben@umialumni.com>
Cc: netfilter@lists.netfilter.org

Ben Russo wrote:

>Since you are working on this anyway....
>
>For a slightly more secure setup, you might want to consider:
>
>
>               R              E          I           
>               T+--------+    X+--------+N          
> internet |---|R| router |---|T|firewall|T|---| intranet
>               I+--------+    I+--------+I        
>               P              P     |     P
>				    |
>				    DMZ IP
>					\
>					| HTTP, MAIL, SSH
>
>This will protect your servers from other intranet users 
>on the same subnet. (Also if you have 802.11 on your intranet...)
>
>Maybe after doing this your problem will disappear simply by 
>rethinking the ruleset.
>
>-Ben.
>
>
>On Wed, 2002-11-13 at 13:13, Rahul Jadhav wrote:
>  
>
>>please check the attachment...
>>
>>Thanks
>>Rahul
>>    
>>
You are right but I am trying to avoid doing that right now as i have 
invested a lot of time already into this system. Moreover, I am pretty 
sure there are people who have got iptables working with a setup like mine.


