From: Francois van Doorneveld <francois@vandoorneveld.org>
Subject: Re: Having a problem loading NETMAP extension.
Date: Sat, 25 Jan 2003 22:00:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E32FAFE.3050509@vandoorneveld.org>
References: <3E32C282.9040508@vandoorneveld.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E32C282.9040508@vandoorneveld.org>
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
To: #LIST-netfilter <netfilter@lists.netfilter.org>

OK, just found out I need to create a new kernel as well. Going to try 
that now.

Francois.

Francois van Doorneveld wrote:

> Howdy all,
>
> I've searched and searched, but I can't seem to get this to work.
>
> I installed the tarball for iptables 1.2.7a. In the tarball there is 
> also the .c file for the NETMAP extension.
>
> I added the NETMAP extension in the Makefile for the extensions. It 
> copies the .so to the directory where the extensions are located, but 
> the following happens:
>
> # iptables -m NETMAP -h
> iptables v1.2.7a: Couldn't load match `NETMAP'
>
> Try `iptables -h' or 'iptables --help' for more information.
>
> Any help on this would be very appreciated, as this is getting 
> frustrating.
>
> Best regards,
>
> Francois
>
>



