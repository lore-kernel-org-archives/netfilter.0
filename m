From: Kim Jensen <kimj@dawn.dk>
Subject: Re: Turning on IP Forwarding
Date: Mon, 24 Mar 2003 15:19:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303241519.50326.kimj@dawn.dk>
References: <FD8F124A387AD6119F7900A0D218B321019C90@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019C90@hslex01.hslbz.local>
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

On Monday 24 March 2003 15:08, Rob Sterenborg wrote:
> Do you mean like, on a RedHat machine :
> /etc/sysctl.conf ->
> net.ipv4.ip_forward =3D 1
>
> Or :
> echo 1 > /proc/sys/net/ipv4/ip_forward
> Which you can put in /etc/rc.d/rc.local or whatever startup file.
>
Both will work, it is up to you to decide where you wish to have this pla=
ced!

I prefer having it as part of my firewall script to start and stop forwar=
ding=20
together with my firewall.

/Kim


