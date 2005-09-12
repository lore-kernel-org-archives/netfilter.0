From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Fwd: Route packets from an interface to another
Date: Mon, 12 Sep 2005 08:19:16 -0700
Message-ID: <43259C74.3000000@wildcash.com>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>	
	<200509091636.37287.rob0@gmx.co.uk>	
	<2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>	
	<200509092345.40386.rob0@gmx.co.uk>
	<43258442.4000009@wildcash.com>	
	<65aa6af905091114314108597e@mail.gmail.com>	
	<65aa6af90509111432525f4bd6@mail.gmail.com>	
	<4325933E.1070902@wildcash.com>	
	<65aa6af9050911145833fa12fd@mail.gmail.com>	
	<4325996D.2070801@wildcash.com>
	<65aa6af9050911151962bc24a2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050911151962bc24a2@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

> Well.. just as I said.. if the boxes in the eth0 lan know how to reach
> the boxes, then you have to do nothing else (translation: if the boxes
> in the 192.168.2/24 network know that the router to reach the
> 192.168.3/24 network is te box we're talking about [it's eth0 IP, of
> course).... or it's default gateway knows... for that matter), then
> you are done.
> 
> And when you configure an interface's IP (and netmask if needed), no
> default GW is set. Only the broadcast address... right?
> 
Yep .. OK great, that's alot clearer now.
I'll be testing and working through this on my LAN at home later today.

Thanks again for following up on this off-topic post.

Best regards,
Rudi.


