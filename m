From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Howto Make Gateway with iptables?
Date: Wed, 10 Mar 2004 09:06:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403100906.18963.Antony@Soft-Solutions.co.uk>
References: <20040310073428.M64644@cc.iut.ac.ir>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040310073428.M64644@cc.iut.ac.ir>
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

On Wednesday 10 March 2004 7:35 am, Mojgan Masroor wrote:

> Hi,
>  I have a linux redhat9.0 - I want to create an gateway between our
> sections  and central site.
> It have 4 ethernet cards. 2 cards for internal LANs with 2 invalid sunbet
> 192.168.101.x and 192.168.102.x range. 3th card for intranet use such
> connect to our web-server or email-server, 4th card for internet connection
> and when they want go to internet.i want also close all extra ports and
> close udp + icmp protocols.
> How i could do this with IPTABLES Rules? Anybody have such this schema?
> Any help would be appriciated

Oskar Andreasson's netfilter tutorial at 
http://iptables-tutorial.frozentux.net should tell you most, if not all, of 
what you need to know.

If you have any specific questions after getting as far as you can with that, 
feel free to come back and ask here.

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


