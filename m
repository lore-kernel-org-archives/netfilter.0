From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: how do I target a specific machine - not ip address?
Date: Sun, 10 Dec 2006 09:47:58 -0800 (PST)
Message-ID: <187188.90378.qm@web56209.mail.re3.yahoo.com>
References: <elhd9c$ema$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <elhd9c$ema$1@sea.gmane.org>
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
To: sean <seandarcy2@gmail.com>, netfilter@lists.netfilter.org

Hi Sean, 

MAC address will not help you. But you can implenment
many other ways to connect to your server. 
First you can change ssh port to listen different than
22, no mater which, I am hoping you know do this. 
Second you can implement iptables rule to accept all 
ssh connections to that port ... something like 
iptables -A INPUT -p tcp --dport 32022 -s any/0 -d
your_server_ip -j ACCEPT
Then implement rules to accept only 2 or more ( it
depends on you ) ssh connection per minute, and you
can make some rule for port knocking in combination
with iptables ( I know port knocking is clear text,
but posible intruder will get only ssh prompt ). 

Of course there are many other security considerations
and I am hoping that other list member will take part
in this discussion.

I hope this helps 

Regards 
Elvir Kuric


--- sean <seandarcy2@gmail.com> wrote:

> I want to connect from travel to my server. Since
> I'm 
> connecting through hot-spots or hotel connections,
> my ip 
> address will be all over the place.
> 
> I thought about putting the laptop's MAC address in
> the 
> packet, and using mac-source, but I've it seems to
> MAC 
> address is stripped out over the internet.
> 
> So, how do I set it up so the server will know my
> laptop 
> from whatever ip address I happen to have.
> 
> BTW, the laptop is linux, so I can mangle
> POSTROUTING if 
> that helps.
> 
> I can ssh, but what I want to do is set up an NFS
> mount.
> 
> sean
> 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

