From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: Port forwarding in special case
Date: Fri, 4 Aug 2006 23:21:10 -0700 (PDT)
Message-ID: <20060805062110.8928.qmail@web56215.mail.re3.yahoo.com>
References: <BAY117-F171920CCD498DEABBC2CC1F5510@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY117-F171920CCD498DEABBC2CC1F5510@phx.gbl>
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
To: notinh notien <notinhnotien7@hotmail.com>, netfilter@lists.netfilter.org

Hi,
I think the next link will help you

http://forums1.itrc.hp.com/service/forums/bizsupport/questionanswer.do?threadId=1032378&admit=-682735245+1154757766144+28353475

just read threads carefuly. Instead port 80 you can
put port 443 as well. Or both. In my case this work.
And of course read
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

best wishes

--- notinh notien <notinhnotien7@hotmail.com> wrote:

> Hi. I am a newbie here,  I need some helps for my
> situation.
> 
> My set up is that I have Apache as the web server
> and set it up so that it 
> would do proxy reverse to the backend web server. 
> It is all good and my 
> user can use the front web server to view the
> content provided by the 
> backend web server.
> 
> So I only open my hardware firewall and forward all
> access to the front end 
> server.  My front end server is a Linux box and have
> iptables to protect it. 
>   Now i need to forward the ports that are not part
> of the Apache reverse 
> proxy (80, 443) to the backend server.
> 
> So you see, my front end server is not a gateway and
> does not provide NAT to 
> any other server like a firewall gateway settings. 
> I already have a 
> hardware firewall to protect these two servers. 
> These two servers are in 
> the same subnet 192.168.0.0/24.  I only need it to
> forward ports to the 
> backend server and return related data for
> connections from the back end on 
> those ports to outside people.  I want people to
> have the impression that 
> they are connecting to the same server because the
> software I used do not 
> allow setting more than one IP address for all the
> services from the end 
> user GUI.
> 
> Could someone here show me how to do this?  Should
> NAT involve in this?
> 
> Thanks.
> 
>
_________________________________________________________________
> Express yourself instantly with MSN Messenger!
> Download today it's FREE! 
>
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
> 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around 
http://mail.yahoo.com 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

