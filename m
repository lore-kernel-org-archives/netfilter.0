From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: simple rules and unexpected traffic
Date: Fri, 5 Jul 2002 00:54:36 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070500543604.06327@Lms>
References: <200FAA488DE0D41194F10010B597610D2BA22C@JUPITER> <20020704224523.GB909@localhost>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020704224523.GB909@localhost>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: christophe =?iso-8859-1?q?barb=E9?= <christophe.barbe.ml@online.fr>
Cc: netfilter@lists.samba.org

On Friday 05 July 2002 00:45, christophe barb=E9 wrote:
> On Fri, Jul 05, 2002 at 08:35:53AM +1000, George Vieira wrote:
> > Yes I've found that some user space programs can see stuff before
> > iptables.. tcpdump too I think...
>
> Yes it sounds logical for tcpdump or tools like that (which pass the
> interface in promiscuisious mode) to see everything. I was not expecting
> the same from a unprivileged app like gkrellm.
> It is stil unclear for me what is the data processing path.
>
> Has someone a clear picture of the packets path ?

It is no problem to open a socket and receive a copy of all raw packets=20
before they get to the kernel iptables modules. See "man 7 packet" for=20
details.

I believe this is how tcpdump does it too.

Jan Humme.

