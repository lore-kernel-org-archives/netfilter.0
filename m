From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Forwarding Help
Date: Thu, 20 Nov 2003 16:23:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBD30C6.2020905@Loudoun-Fairfax.com>
References: <SEA2-DAV257n6Hj1yNr000056bb@hotmail.com> <200311202040.hAKKex723544@onyx.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311202040.hAKKex723544@onyx.rockstone.co.uk>
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

Antony Stone wrote:

>On Thursday 20 November 2003 8:26 pm, Michael Menges wrote:
>
>  
>
>>GlacierHello folks.  What's the best way to handle this situation:
>>
>>I wish to have my gateway/firewall using iptables to forward incoming
>>internet traffic destined to port 443 (https) to another machine on my
>>localnet (192.168.0.10) keeping the same port number, obviously.  I'm on a
>>cable connection with a dynamic IP address, of course. I've read the FAQ's
>>and man page but yet unable to come up with the proper syntax.  Any generic
>>command structures would be most helpful.
>>    
>>
>
>iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j DNAT --to 
>192.168.0.10
>iptables -A FORWARD -d 192.168.0.1 -p tcp --dport 443 -j ACCEPT
>  
>

Do you mean  -d 192.168.0.10 here?  ;-)

>eth0 is your external interface.   Adjust the rule if this assumption is 
>incorrect
>
>Ask if you don't see why the above rules do what you want.
>
>PS: What does "Glacier" mean?
>  
>

That didn't show up in my mail. I think it has something to do with his 
html formatting.

Jeff



