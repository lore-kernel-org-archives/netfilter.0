From: "Andrew Magnus" <xanadian9@hotmail.com>
Subject: Re: how to drop MP3 and other Downloads
Date: Wed, 13 Nov 2002 09:07:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F539FmGvZ3e61Hx5RMA0000b147@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


This, of course, brings up a question I've been thinking about.

Is there a patch that will allow iptables to read into the header for the 
presentation layer to filter out, for example, MP3s being downloaded?

Thanks.



>From: "hare ram" <hareram@sol.net.in>
>Reply-To: "hare ram" <hareram@sol.net.in>
>To: "Antony Stone" 
><Antony@Soft-Solutions.co.uk>,<netfilter@lists.netfilter.org>
>Subject: Re: how to drop MP3 and other Downloads
>Date: Tue, 12 Nov 2002 19:35:14 +0530
>
>hi some one guided in the news group
>
>----
>That of course was not the connbytes patch. You can find it at
>http://luxik.cdi.cz/~devik/connbytes/.
>
>You may need some sort of crontab to change the rules as you go. You can
>also use connbytes with the --mark to move all long lived downloads to a
>lower tc class if your doing traffic shaping.
>------
>
>
>what you think about this
>
>thanks
>hare
>----- Original Message -----
>From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
>To: <netfilter@lists.netfilter.org>
>Sent: Tuesday, November 12, 2002 6:13 PM
>Subject: Re: how to drop MP3 and other Downloads
>
>
> > On Tuesday 12 November 2002 12:13 pm, hare ram wrote:
> >
> > > Hi all
> > >
> > > i have small application here like
> > > how do the drop all downloads more than 1MB from
> > > the day time
> > > and rest of the time open for all
> >
> > I don't see that netfilter can know a download is going to be more than
> > 1Mbyte before it's already seen a million bytes downloaded...
> >
> > Antony.
> >
> > --
> >
> > There are two possible outcomes.
> >
> > If the result confirms the hypothesis, then you've made a measurement.
> > If the result is contrary to the hypothesis, then you've made a 
>discovery.
> >
> >  - Enrico Fermi
> >
> >


_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus


