From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Filtered Port
Date: Tue, 31 Jan 2006 15:06:37 +0100 (CET)
Message-ID: <61929.193.173.147.3.1138716397.squirrel@webmail.sterenborg.info>
References: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tue, January 31, 2006 14:55, Scott Mayo wrote:
> I am not sure if this is my iptables or not, but I am not sure where
> else to look or ask.  I am trying to use Remote Desktop on a
> computer.  From inside my network, it works fine, but once I get
> outside, I cannot use it.  I have set my IPTABLES to forward anything
> going to port 3389 to the computer that is using Remote Desktop.
>
> The problems seems to be that port 3389 is filtered.  I can find
> nothing in my iptables where I have this port filtered.  Are there
> some generic ports, that IPTABLES filters on it own or something?  If
> the IPTABLES are not filtering it, what else could be?

You allow forwarding to this host but you also need to DNAT these
packets from the internet IP to the IP of your computer.

$ipt -t nat -A PREROUTING -i <if_inet> -d <ip_inet> \
  -p tcp --dport 3389 -j DNAT --to <ip_controlled_host>


Gr,
Rob



