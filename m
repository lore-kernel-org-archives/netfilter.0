From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mangle tables.
Date: Tue, 10 Sep 2002 11:12:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209101013.g8AAD3v06687@vulcan.rissington.net>
References: <3D7D9614.1040205@fugmann.dhs.org> <200209100939.g8A9d0v06610@vulcan.rissington.net> <3D7DC3EF.6060709@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7DC3EF.6060709@fugmann.dhs.org>
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
To: netfilter@lists.samba.org

On Tuesday 10 September 2002 11:05 am, Anders Fugmann wrote:

> Antony Stone wrote:
> > On Tuesday 10 September 2002 7:49 am, Anders Fugmann wrote:
> >>Next, if the above is correct, when does packets hit the chains,
> >>e.g. what chains are traversed between PREROUTING and FORWARD and
> >>POSTROUTING, in the forwarding example?
> >
> > I don't know the answer to this for the latest version of netfilter,
> > however it is very easy to find out for yourself, for the specific
> > version you are running (which is usually the important thing).
>
> Is this true - can someone please confirm this. It seems strange that
> only the order of chain traversal is specified within a table, but not
> across tables (If I understand you correctly, Antony).
> This means, for example, that the mark cannot be used to to mark packets
> for later processing. (Mark in mangle and match in filter).

No, that's not what I meant, and you can indeed use MARK in the way you 
suggest.

The order of traversing both tables and chains is completely defined in 
netfilter, and unless you seriously start fiddling around with the source 
code you cannot change it.

However, I suggested that you should check the order for your particular 
version of netfilter for two reasons:

1. More recent versions have added more hooks (specifically to the mangle 
table, which is now available in all five chains; previous it was only 
available in PRE- and POSTROUTING), so you will find out all the chain / 
table combinations you have.

2. I believe about six months ago there was a rearrangement between nat and 
mangle (?) so that they got processed in the opposite order.   Again, you 
would want to know for your own version, not for some older or newer version 
which you aren't running...

> > Simply set up a series of LOGging rules in the different chains & tables,
> > send some packets through the system, and the log file will tell you what
> > order the packets went through the different parts of netfilter.
> >
> > Try this:
> >
> > for chain in INPUT OUTPUT FORWARD PREROUTING POSTROUTING
> > do
> >   for table in filter mangle nat
> >   do
> >     iptables -I $chain -t $table -j LOG --log-prefix="$chain $table "
> >   done
> > done
>
> Yes, but I was hoping to avoid it :-)

Why ?

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

