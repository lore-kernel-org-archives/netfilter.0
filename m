From: Kim Jensen <kimj@dawn.dk>
Subject: Re: Help needed
Date: Wed, 26 Mar 2003 13:11:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303261311.10102.kimj@dawn.dk>
References: <2777.192.168.35.14.1048582432.squirrel@webmail.satconet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2777.192.168.35.14.1048582432.squirrel@webmail.satconet.com>
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
To: steven.mugassa@mail.intafrica.com, netfilter@lists.netfilter.org

On Tuesday 25 March 2003 09:53, steven.mugassa@mail.intafrica.com wrote:
> Hello everybody!
>
> In our network we have a private IP that is NATed to public IP (using
> iptables SNAT...). What I need is to confirm that this private IP is
> really NATed to that particular public IP as I defined.
>
> Is there any command in Linux that will help me to do that?
>
Try to run a tcpdump on your incoming and outgoing interface - then you s=
hould=20
what happens.

/Kim


