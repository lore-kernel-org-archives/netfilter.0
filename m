From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip conntrack.ftp.c and ip_nat_ftp.c and DNAT
Date: Tue, 18 Jun 2002 12:11:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206181111.MAA26328@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 18 June 2002 11:02 am, luoqiang wrote:
> Hi,Antony
>
>     Because  I am writing a module for SIP ALG,the most difficult thing for
> me is to open a hole on firewall in the module. I read the howto and refer
> to ftp module code ,but I still don't know how to archieve the purpose.So I
> list the simple DNAT example.
>     I had ask the alike question in netfilter-devel@lists.samba.org,but  I
> didn't get my wanted answer.:-(
>     Can you tell me where is my mistake?

Sorry - I don't know anything about SIP ALG (I don't even know what it is !),
so I can't help with this question.

Maybe somebody else on the list who's done some netfilter hacking ?



Antony.

> -----------------------------------------------------
>
> > > Hi,all
> > >
> > >     After reading the hacking howto and the code of ip_conntack_ftp.c
> > > and ip_nat_ftp.c,I want to write a module for DNAT to achieve the
> > > purpose as follows:
> > >
> > >
> > >
> > > iptables -A PREROUTING -t nat -p udp -d 159.226.1.1 --dport 5003
> > > -j DNAT --to 192.168.1.2:5003
> >
> > Excuse my ignorance here, but why do you need to write a module for this
> > ? Why can't you just do it with a rule such as the one you've written ?
> >
> >
> > Antony.

