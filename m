From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: allow DCC through iptables nat box
Date: Mon, 29 Aug 2005 21:24:38 +0300
Message-ID: <431352E6.5030809@gmail.com>
References: <43133603.3010005@mit-web.dk>
	<9255886c050829094144ddcd3a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9255886c050829094144ddcd3a@mail.gmail.com>
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

I think this module is included in 2.6 kernel trees, isn't it? Please 
correct me if i'm wrong... Thank you!

Sp0oKeR wrote:
> You can use Patch O Matic module
> 
> 5.4 irc-conntrack-nat patch
> 
> This patch by Harald Welte <laforge@gnumonks.org> allows DCC to work
> though NAT and connection tracking. By default, this module will track
> IRC connection on port 6667. But you can change this for another port
> with the `ports=xx' argument.
> 
> http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-5.html#ss5.4
> 
> Regards,
> 
> Sp0oKeR
> 
> On 8/29/05, Lars Nielsen <lars@mit-web.dk> wrote:
> 
>>Hey
>>
>>I have the following setup:
>>
>>LAN      192.168.1.0/24
>>   Linux box with iptables
>>       eth0   192.168.1.1
>>       eth1   ext_ip
>>internet
>>
>>I use the following to allow internal clients to access the internet.
>>iptables  -t nat -A POSTROUTING -o eth1 -s 192.168.1.0/24 -d 0/0 -j
>>MASQUERADE
>>
>>Which rules should i use to allow DCC to and from an internal Mirc
>>client on ip 192.168.1.2
>>
>>I hope you can help me! ;o)
>>
>>Best regards Lars Nielsen
>>
>>
>>
> 
> 
> 

