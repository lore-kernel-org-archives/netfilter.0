From: Rickard Eriksson <riceri@home.se>
Subject: Re: PPTP
Date: Fri, 11 Oct 2002 11:27:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA6999B.80609@home.se>
References: <E131E9F1848D0148813EAF06A846608F615F73@w2ks-e2k.iconos.be>
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
To: Sneppe Filip <Filip.Sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

Sneppe Filip wrote:

> Rickard Eriksson [mailto:riceri@home.se] wrote:
> >
> >
> >Do i need newest iptables to get the modules to work?
> >
>
> Hi,
>
> No, not with these types of modules (conntrack/nat helpers).
> We're only talking kernel code here. You need to run the
> correct iptables if you are adding match and target extensions.
>
> Regards,
> Filip
>
>
>
>
When i try to restart and load the modules i get a error, i didn't copy 
it but it was something about "unresolved ... helper"
And i can't find any setting in "make config" so that it shall make the 
helper in any way.

Do you know what i am talking  about :)

/Rickard




