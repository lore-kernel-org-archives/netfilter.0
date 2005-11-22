From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: ip_conntrack_ftp as a module or built-in?
Date: Tue, 22 Nov 2005 12:19:55 +0100 (CET)
Message-ID: <54076.193.173.147.3.1132658395.squirrel@webmail.sterenborg.info>
References: <20051122104702.GC27443@rigacci.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051122104702.GC27443@rigacci.org>
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

On Tue, November 22, 2005 11:47, netfilter@rigacci.org wrote:
> Hello,
>
> sorry for this generic question, but I searched long, without any
> clue.
>
> On my linux box I load the ip_conntrack_ftp module with some
> parameter (to let the HylaFAX daemon talk with the clients):
>
>     insmod ip_conntrack_ftp ports=3D21,4559
>
> Is there a way to pass that "ports" parameter to the kernel, if
> the feature is compiled into the kernel, instead of as a module?

I'm not sure if passing that parameter to the kernel during boot time
will work (probably not).
Why would you do that anyway : why not use the module ?


Gr,
Rob



