From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 10:40:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911144045.GU7289@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0209111237190.32463-100000@dns.toxicfilms.tv> <200209111248.g8BCmAv08513@vulcan.rissington.net> <20020911135903.GT7289@cannon.eng.us.uu.net> <200209111608.26999.roy@karlsbakk.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200209111608.26999.roy@karlsbakk.net>
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
Content-Transfer-Encoding: 7bit
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

On Wed, Sep 11, 2002 at 04:08:26PM +0200, Roy Sigurd Karlsbakk wrote:

> > > Folks: don't try looking up the 5th layer of the TCP networking model :-)
> >
> > What's wrong with his statement? As Maciej said the 5th layer of the IP
> > model is the application layer:
> >
> >                  --------------
> >       layer 5   |  application |
> >                  --------------
> >       layer 4   |  TCP / UDP   |
> >                  --------------
> >       layer 3   |      IP      |
> >                  --------------
> >       layer 2   |  data link   |
> >                  --------------
> >       layer 1   |   physical   |
> >                  --------------
> 
> 
> You don't have any separate data link and physical layers in the IP model, as 
> far as I remember. It's a 4-layer model, and goes something like this
> 
> +-------------+
> | Application |
> +-------------+
> | Transport   |
> +-------------+
> | Network     |
> +-------------+
> | Physical    |
> +-------------+

Yes. What it meant (IMO) is that IP doen't care about the layers below it.
It can be plugged into any LAN/WAN structure. But in the lowest layer in
your ASCII art there is still the seperation of the physical properties of
your medium (like electrical or optical properties) and link layer data
transfer (like framing, encoding, ...). Another reason for me to believe that
IP is at the third layer is the terminologies like "layer three switching",
L2TP ...

Ramin

> 
> roy
> -- 
> Roy Sigurd Karlsbakk, Datavaktmester
> ProntoTV AS - http://www.pronto.tv/
> Tel: +47 9801 3356
> 
> Computers are like air conditioners.
> They stop working when you open Windows.

