From: David Cannings <lists@edeca.net>
Subject: Re: Redirecting ports on localhost
Date: Tue, 30 Mar 2004 20:13:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403302013.40298.lists@edeca.net>
References: <20040330133505.22298.90925.Mailman@vishnu.netfilter.org> <406980E5.6080107@personalsoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <406980E5.6080107@personalsoft.com.br>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 30 March 2004 15:15, Fabiano Bonin wrote:
>  > On Tuesday 30 March 2004 13:46, Fabiano Bonin wrote:
> >> iptables -F
> >> iptables -F -t nat
> >> iptables -A OUTPUT -t nat -p tcp -o lo -d 192.168.0.254 --dport 5050
> >> -j REDIRECT --to-ports 5050
> >> echo "1" > /proc/sys/net/ipv4/ip_forward
> > I don't think you need anything special to do this however your rule
> > says "any packets going out on loopback to 192.168.0.254".  The only
> > machine on your network that would send packets to 192.168.0.254 on
> > loopback is the machine with that IP itself.
> > Perhaps I misunderstand what you are trying to accomplish, apologies
> > if so.
>
> Most probably you understood what i am trying to do, and the way i'm
> trying (as shown in the examples) is entirelly wrong. I used iptables
> few times before and i'm not skilled with it.
>
> Maybe you can show the command needed to my case (i.e., using DNAT as
> you told above). Sorry if i'm asking too much... I just need the hosts
> on my local network can access this port through server's eth0.

http://netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.2

I've linked to the English HTML version of the HOWTO, other languages and 
formats are available at:

http://netfilter.org/documentation/index.html#documentation-howto

Have a read, see if you can make some sense of it.  If not, post back with 
what you've tried and why it doesn't work.  For the record, I've never 
tried redirecting a port to localhost although I can see no reason why it 
would not work as any other does.  I will have to give it a go myself 
when I have a few minutes spare.

Hope that helps,

David

