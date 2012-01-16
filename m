From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Dual WAN set-up
Date: Mon, 16 Jan 2012 16:43:37 -0500
Message-ID: <201201161643.38037.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Monday 16 January 2012 3:28:14 pm you wrote:
> On Mon, 16 Jan 2012 08:56:23 -0600, Dimitri Yioulos 
<dyioulos@onpointfc.com> wrote:
> > Before I commit this new set-up, I'd like to post the
> > ste-by-step instructions I wrote up for your kind review:
>
> I don't quite understand your network configuration, but the
> ideas we provided on split-access to uplinks should adaptable
> to any situation.
>
> > Under this set-up, don't I need to add POSTROUTING AND
> > FORWARDING rules?  Sorry for my stupidity, but I set the
> > original up a long time ago, and certainly don't know all
> > there is to know.  Your continued patience and support are
> > greatly appreciated.
>
> The PREROUTING chain of the mangle table will handle the
> marking of new connection packets as well as recovery of the
> connection mark to the packet mark.  There should be no other
> iptables stuff required to mark the packets, and "ip rule add
> fwmark..." will handle sending the marked packets to the right
> routing table.
>
> I think you are doing SNAT, which uses POSTROUTING chain.  You
> you will want to keep that.
>
> Others here are much more knowledgeable and may have more
> comments. --
> Lloyd

Thanks, Lloyd.  Sorry if I'm being a pita.  I think what I'll do 
is follow your instructions, but liven up a test server first 
(doh :-)  ).  Of course, if that works, the rest is cake.  If it 
doesn't, hopefully I'll have some error messages/more information 
to post back so that we can do some troubleshooting.  Sound 
reasonable?

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

