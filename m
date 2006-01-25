From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: First rule in the list seems to allow everything?
Date: Wed, 25 Jan 2006 16:09:13 +0100 (CET)
Message-ID: <51792.193.173.147.3.1138201753.squirrel@webmail.sterenborg.info>
References: <B584AAC32ED8DE49A8EAD2CF3D847FE00222558B@auth-fl-mail1.commandsoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B584AAC32ED8DE49A8EAD2CF3D847FE00222558B@auth-fl-mail1.commandsoftwar
	e.com>
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

On Wed, January 25, 2006 15:58, Arthur DiSegna wrote:
>
>
> Hello,
>
> I set my IPTABLES policy to clear all rules and then drop everything
> before defining a policy. I suspect this is the default procedure
> everyone uses from the looks of the web. Anwyay, when I run iptables
> -L
> -n the first line reads:
>
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> RULES      --------			---	------
> RULES      --------			---	------
>
> Doing an nmap scan on the box only shows the open ports I specified
> in the ruleset. This is good. However, the Accept all above in the
> first line has me a little confused. What is happening here?

Try listing the rules with :
iptables -nvL


Gr,
Rob



