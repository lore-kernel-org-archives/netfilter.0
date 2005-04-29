From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: iptables startup/initialization
Date: Fri, 29 Apr 2005 09:03:54 -0400
Message-ID: <200504290903.54971.Alistair@nerdnet.ca>
References: <4271a19b.662875ec.2288.402bSMTPIN_ADDED@mx.gmail.com>
	<9927912d050429005922ecbd8d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d050429005922ecbd8d@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On April 29, 2005 03:59 am, Visham Ramsurrun wrote:
> Hi to all,
>
	Greetings: and first lesson, always rewrite the subject when using the digest 
to reply to the list -- PLEASE!! (it gets you more attention and better 
responses)

> I wanted to know what we actually need to start iptables service on a
> PC. Do we have to write start or initialisation scripts?

Umm ... no its part of the kernel.  However if you want it to actually do 
something useful you need startup and shutdown scripts or a flat load file.

My personal preference, and is available on many distributions is to manually 
build the firewall baseline, using iptables -A and iptables -I etc, then use 
iptables-save to store the basics and then update as required.  Somewhere in 
your rc.* scripts there should be iptables-restore -c < {file_Name}.

	However, some distro's don't have startup and shutdown scripts.  Thus, 
suggesttions are to create a script that contains all the iptables commands 
to create your firewall, a la Oskar Andreasson's rc.firewall.txt script (see 
netfilter.org's website for a pointer to Oskar's howto, it is in my books the 
premier to understand iptables) and include a call to it somewhere in your 
rc.x scripts.  Good logic suggests that you get that loaded *before* your 
interfaces come up and connect.

	In my gentoo desktop, I've modified the /etc/init.d/iptables script to keep 8 
previous copies of my firewall  in /var/lib/iptables ... but then I'm 
completely crazy.

	Powerful suggestion is that you read Oskar's howto.  It sounds like you could 
use the info.


	Alistair Tonner

>
> If yes, can I can a sample of these scripts?
>
> Regards,
> Visham

