From: "hare ram" <hareram@sol.net.in>
Subject: Re: how to drop MP3 and other Downloads
Date: Tue, 12 Nov 2002 19:35:14 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017601c28a54$85cebe40$13fcc5cb@nextto>
References: <Pine.LNX.4.44.0211120954570.4953-100000@mestre.edumed.org.br> <088301c28a44$e3aa6740$13fcc5cb@nextto> <200211121243.gACChJe29998@vulcan.rissington.net>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

hi some one guided in the news group

----
That of course was not the connbytes patch. You can find it at
http://luxik.cdi.cz/~devik/connbytes/.

You may need some sort of crontab to change the rules as you go. You can
also use connbytes with the --mark to move all long lived downloads to a
lower tc class if your doing traffic shaping.
------


what you think about this

thanks
hare
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, November 12, 2002 6:13 PM
Subject: Re: how to drop MP3 and other Downloads


> On Tuesday 12 November 2002 12:13 pm, hare ram wrote:
>
> > Hi all
> >
> > i have small application here like
> > how do the drop all downloads more than 1MB from
> > the day time
> > and rest of the time open for all
>
> I don't see that netfilter can know a download is going to be more than
> 1Mbyte before it's already seen a million bytes downloaded...
>
> Antony.
>
> --
>
> There are two possible outcomes.
>
> If the result confirms the hypothesis, then you've made a measurement.
> If the result is contrary to the hypothesis, then you've made a discovery.
>
>  - Enrico Fermi
>
>


