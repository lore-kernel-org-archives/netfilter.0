From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IpTables question...
Date: Thu, 6 Feb 2003 00:28:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302060028.22169.netfilter@newkirk.us>
References: <F9VYbb0fBGr4zL748kF00020127@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F9VYbb0fBGr4zL748kF00020127@hotmail.com>
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
To: Curca Claudiu <rapandulex@msn.com>, netfilter@lists.netfilter.org

On Monday 03 February 2003 01:47 am, Curca Claudiu wrote:
> I'm using RedHat Linux 8.0 on an PIII - Coppermine 750 MHz. I used
> Iptables for NAT  networking at my home (5 PC's + 1 Server).
> The server is used as a gateway and dns server. My question is:
>
> Is there any way I could limit the transfer rate of the inside
> computers to the internet?
> For example I want 192.168.3.5 to have a limit of 5 KB/s transfer
> rate.
>
> Please help me!!

You need to establish a Queueing Discipline.  Your best choice would=20
probably be Hierarchical Token Bucket.  See=20
http://lartc.org/howto/lartc.qdisc.classful.html#AEN1050 in the Linux=20
Advanced Routing and Traffic Control how-to for details on HTB, (and the=20
full how-to for all the info...) and the section following it entitled=20
"Classifying packets with filters" which explains how to specify a=20
filter that matches specific IPs, or use the 'fwmark' match to let you=20
set a mark in an iptables mangle-table PREROUTING chain and queue=20
traffic based on the marks.

j


