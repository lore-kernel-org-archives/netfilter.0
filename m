From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Howto Make a gateway with iptables rules?
Date: Wed, 10 Mar 2004 18:52:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403101852.48099.Antony@Soft-Solutions.co.uk>
References: <20040310054905.M99122@cc.iut.ac.ir>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040310054905.M99122@cc.iut.ac.ir>
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

On Wednesday 10 March 2004 5:53 am, masroor wrote:

> Hi,
>   I have a linux redhat9.0 - I want to create an gateway between our
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

(Yes, I know this is the same answer as I gave this morning, but then, it's 
the same quesion.)

-- 
What makes you think I know what I'm talking about?
I just have more O'Reilly books than most people.

                                                     Please reply to the list;
                                                           please don't CC me.


