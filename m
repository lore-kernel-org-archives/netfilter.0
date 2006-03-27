From: Mike Wright <ebwximaurm@mailinator.com>
Subject: Re: Multiple IP addresses
Date: Sun, 26 Mar 2006 19:30:09 -0800
Message-ID: <44275C41.4070603@mailinator.com>
References: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Will Twomey wrote:
> I apologize if this is the wrong list, but...
> 
> I would like to have several (3?) ip addresses on one interface (eth0,
> eth0:1, etc.), 

Aliasing your network card isn't necessary.  Just assign IP's to it.

ip address add 192.168.0.1/24 dev eth0
ip address add 192.168.1.1/24 dev eth0
ip address add 192.168.2.1/24 dev eth0

> and forward each of those IP addresses to another
> interface (192.168.0.1, 192.168.1.1, 192.168.2.1, etc.)

I think these might work.

iptables -A FORWARD -d 192.168.0.0/24 -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -d 192.168.1.0/24 -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -d 192.168.2.0/24 -i eth0 -o eth3 -j ACCEPT


> Does anyone have an advice for me, or a good place to learn how to do this?
> 
> If someone has an iptables/netfilter script that does this, I'd love
> to see it. :D
> 
> Thanks!
> 
> --
> Will Twomey
> http://UnhandledExceptions.com



