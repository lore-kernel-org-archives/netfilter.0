From: Vadim Kurland <vadim@vk.crocodile.org>
Subject: Re: inner workings of IP tables
Date: Sun, 29 Sep 2002 20:16:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D97C228.6030602@vk.crocodile.org>
References: <Pine.LNX.4.40.0209292103480.19136-100000@klepto.security.algx.lan>
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
To: netfilter@lists.netfilter.org



Kevin Dwyer wrote:

>>At least with a CLI you're in full control, even if you need to learn
>>a bit more syntax before you start typing.
>>    
>>
>
>Precisely.
>This is seen as a drawback to some people, because you are given the gun
>with which to shoot yourself in the foot.  However, I'd prefer to have a
>competent firewall admin over a point-and-click lemming.
>
>  
>

I would like to assert that in the case of CLI we are just as like in 
the mercy of a vendor who may or may not implement interfaces to certain 
features of underlying software. I prefer to think of these components 
as layers of different level of abstraction and access: first, there is 
TCP/IP stack, then a set of hooks and kernel functions, then perhaps a 
CLI tool to configure this stuff and on top of that may be a GUI. This 
is rough and inaccurate model which I have here just to explain my 
point. Each level needs to be implemented and while doing so certain 
features of underlying levels may get dropped by various reasons.

Cluefullness of firewall administrator has almost nothing to do with a 
type of user interface firewall he prefers to use. Like we never saw 
wrong firewall configurations done in iptables, or in ipfilter, or PIX 
using their CLI. In the end, what matters is how much time one needs to 
spend building rules and verifying them, and what is the proprability of 
an error still slipping through. Anything that can help reduce this 
probablility is useful, even if it is a GUI.

Another reason is this: what if you have a staff and need several 
engineers to be able to work on the same policy at different times? 
Again, anything that can make this policy look uniform and 
understandable is useful.

I agree that interface does induce certain model and makes us think of a 
subject in a certain way... That is of course true and choice of good 
unterface, both CLI and a GUI, is a difficult task. But this is a 
different interesting topic, which can be far more scientific that 
religious war of CLI versus GUI.

--vk




