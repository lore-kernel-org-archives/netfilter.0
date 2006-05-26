From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: Linux box to D-Link router/bridge/access connection question
Date: Thu, 25 May 2006 20:36:29 -0700
Message-ID: <01d901c68075$934ffe60$5e00800a@printserver>
References: <16131225.1148613246146.JavaMail.root@elwamui-lapwing.atl.sa.earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: martinh@ix.netcom.com
Cc: netfilter@lists.netfilter.org

Martin,
I just noticed that this thread was carying on in the netfilters list, and 
is thereby a little bit off-topic. (I had just assumed that it was on 
another general topic linux list to which I am subscribed.) Perhaps we 
should exclude the netfilter list from any further discussion on this topic.

(Sorry about that, netfilter!)

> My answers to your questions below...
>
> Ans: I like to be able to send and receive files. I would also want to 
> from my WinXP laptop to print to my linux box printer.
>

You probably want to use Samba on  the linux boxes for sharing files and 
printers.

> Ans: Windows XP using wireless (no network cable) is browsing the Internet 
> using highspeed dlink.

What's the IP on your laptop? It's probably dhcp.

> Ans: Can I change my linux box netmask to 255.255.0.0, will that allow my 
> laptop to communicate with my linux boxes? - they are 192.168.1.2 & 50.

I would need to know the ip and netmask on your laptop in order to answer 
the above.

If  your laptop's ip starts with 192.168 and has a netmask of 255.255.0.0 
then setting the netmask to 255.255.0.0 on the linux box would allow them to 
communicate.

But note that redhat might or might not (I Haven't used redhat in many 
years) come by default to be set up running samba, but you will need samba 
installed and running in order to drag files to and from the linux 
computers.

samba will also let you share the printer which is installed on the linux 
boxes.

I'm just very unfamiliar with the specific tools available on redhat, but 
hopefully this has helped give you a general direction.

Hope this helps,

Jesse 



