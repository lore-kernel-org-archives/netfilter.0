From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 1 Sep 2004 13:38:47 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409011734.i81HYpb0087633@jkcpub.iserver.net>
References: <8ca4228204090108466549b5f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca4228204090108466549b5f3@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Mike' <1100100@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi Mike,
Sorry for the late reply. I have been busy since morning.
I see that some of your questions have been answered by Jason & Alistair.
Let me first answer your 2nd question:
 - If you are not using a "chain" for setting up rules but set the default
policy to "drop" and if a packet traverses that chain then it will be
dropped. Hence by putting rules, I classify packets that I want to allow.
The rest will be dropped by default. 

I guess your 1st question is answered now: Yes, rules appended will override
the default policies.

This is how I would write the policies to achieve your goal:

Default policy for chains in Mangle & Nat tables to ACCEPT.
Default policy for chains in filter table to DROP.

Open dports ports 80 & 22 on the INPUT, FORWARD & OUTPUT chains.
Enable stateful firewall rules on these chains.
ACCEPT only NEW packets.

I do not know the port # for samba services.

Hey, I am glad the diagram worked out for ya.
Hope this helps.
Take care,

Deepak Seshadri


-----Original Message-----
From: Mike [mailto:1100100@gmail.com] 
Sent: Wednesday, September 01, 2004 11:46 AM
To: Deepak Seshadri
Cc: netfilter@lists.netfilter.org
Subject: Re: Policy Misunderstanding: RTFM Guidance Requested.

Hi Deepak,

Thank you for your response.

On Wed, 1 Sep 2004 09:27:22 -0400, Deepak Seshadri
<dseshadri@broadbandmaritime.com> wrote:
> 
> If the default policy on your mangle & Nat chain is set to DROP & if you
> have no rules to classify traffic in these tables, all your packets will
get
> dropped here. They will not make it to the FILTER table.

This is a good point and shows where maybe I am starting to MIS-understand.


1.  Can appended rules override default polices? 
2.  Do you need to include appended rules to parts of the iptables
chain that you are not using, or else all the packets will get
dropped?  For example, do you have to set Mangle rules even if you are
not using any Mangling but have set a DROP policy for mangling.

> 
> In your commands, first you have set the default policy to DROP on all
> chains in the filter table. Then you have set policies to accept all the
> traffic in the INPUT & OUTPUT chains. I do not get this. If you are aiming
> to accept all packets in the INPUT & OUTPUT chain you might as well set
the
> default policy in these chains to ACCEPT.

I understand your point here.  I used those -j ACCPT rules because
everything else has failed so far to override the DROP policy, so that
was a last resort desperately trying to get some packets through the
routerbox.  I really don't want to accept everything blindly on the
INPUT and OUTPUT of the routerbox.  I would actually like to set
INPUT/OUTPUT rules that only allow traffic on a few different ports
for web browsing, ssh access, and network samba; close everything
else.


> I will email you a diagram on the packet flow inside the kernel. Probably
> that would make things easier in understanding where each chain exists
> inside the kernel.
> 

Hey now, thanks for the diagram.  This is pretty cool stuff.  I need a
few months to figure it all out though.  :-)

Please write back on the other issues above if you have a chance.
Hope to hear from you.

Thanks,

Mike


