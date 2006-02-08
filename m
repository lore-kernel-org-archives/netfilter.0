From: Markus Wells <markus@wiztech.cc>
Subject: Re: How to I bounce/redirect packets from one external ip to
	another?
Date: Wed, 08 Feb 2006 11:34:08 -0800
Message-ID: <43EA47B0.6040100@wiztech.cc>
References: <43E817D9.1080209@wiztech.cc>
	<5c6851530602071916l59f6797dj6c704f012b158462@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5c6851530602071916l59f6797dj6c704f012b158462@mail.gmail.com>
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
To: Robb Bossley <robb.bossley@gmail.com>, netfilter@lists.netfilter.org

  Thank you for the advice, but here's what I ended up doing and it 
worked, although I definitely have to say that your solution is more 
secure. But as it is forwarding to my isp's news provider's server, I 
just don't care....   :D

Here's what I did:

/usr/sbin/iptables -t nat -A PREROUTING  -p tcp -d <my outside ip> 
--destination-port nntp -j DNAT --to-destination 216.168.3.44:119
iptables -t nat -A POSTROUTING -p tcp --dst 216.168.3.44 --dport 119 -j 
SNAT --to-source $WAN_IP
/usr/sbin/iptables -A FORWARD -p tcp -d 216.168.3.44  --dport 119 -j ACCEPT

  When I get a chance I'll restrict the access to it with the -s switch, 
but as my house just had an electrical fire, I'm just not terribly 
worried about it!


Thanks for the feedback!


Robb Bossley wrote:
> If you open up (or use port knocking) to access your home firewall ssh
> port and us# forward 1234 (nntp)
/usr/sbin/iptables -t nat -A PREROUTING  -p tcp -d 206.124.144.176 
--destination-port nntp -j DNAT --to-destination 216.168.3.44:119
iptables -t nat -A POSTROUTING -p tcp --dst 216.168.3.44 --dport 119 -j 
SNAT --to-source $WAN_IP
/usr/sbin/iptables -A FORWARD -p tcp -d 216.168.3.44  --dport 119 -j ACCEPT

e an ssh tunnel from wherever you are logged in to your
> home firewall, you might be able to do it.  Something like "ssh -L
> <localport>:<hostip>:<hostport> <ipaddress>" .  Just fill in the
> blanks.
> 
> This assumes that your home firewall is running sshd, of course.
> 
> 
> 
> On 2/6/06, Markus Wells <markus@wiztech.cc> wrote:
> 
>>  I'm travelling and I want to access my news server remotely. They have
>>it set up so that it will only accept connections originating from my
>>home ip, so I was hoping one of you packet mangling gurus might have a
>>couple lines of code so that I can redirect nntp traffic from an
>>arbitrary external ip to another external ip(the news server) via my
>>home firewall.
>>
>>  Thank you for any help you can offer!
>>
>>Markus
>>
>>

