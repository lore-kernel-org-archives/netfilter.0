From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: Clear Iptables chains?
Date: Mon, 8 Jul 2002 18:34:19 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070818341908.14428@Lms>
References: <839BF5387528D311AD5D00902751CFC301B0419A@HAVASSMX> <200207081456.g68EuF807141@vulcan.rissington.net> <200207081522.g68FMr807248@vulcan.rissington.net>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207081522.g68FMr807248@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

On Monday 08 July 2002 17:22, Antony Stone wrote:
> On Monday 08 July 2002 3:56 pm, Antony Stone wrote:
> > On Monday 08 July 2002 3:46 pm, Lukas Ruf wrote:
> > > iptables -P INPUT ACCEPT
> > > iptables -P OUTPUT ACCEPT
> > > iptables -P FORWARD ACCEPT
>
> I'd prefer to see:
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>
> Then you add in the rules for the stuff your definitely know you want to
> allow.

Certainly.

What about default policies for the nat and mangle tables?

Or perhaps you find that it doesn't belong here?

Jan Humme.

