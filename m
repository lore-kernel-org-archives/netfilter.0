From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 15:50:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111450.g8BEoZv08791@vulcan.rissington.net>
References: <Pine.LNX.4.44.0209111237190.32463-100000@dns.toxicfilms.tv> <200209111608.26999.roy@karlsbakk.net> <20020911144045.GU7289@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020911144045.GU7289@cannon.eng.us.uu.net>
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

On Wednesday 11 September 2002 3:40 pm, Ramin Alidousti wrote:

> On Wed, Sep 11, 2002 at 04:08:26PM +0200, Roy Sigurd Karlsbakk wrote:
> > > > Folks: don't try looking up the 5th layer of the TCP networking model
> > > > :-)
> > >
> > > What's wrong with his statement? As Maciej said the 5th layer of the IP
> > > model is the application layer:
> >
> > You don't have any separate data link and physical layers in the IP
> > model, as far as I remember. It's a 4-layer model, and goes something
> > like this
> >
> > | Application |
> > | Transport   |
> > | Network     |
> > | Physical    |
>
> Yes. What it meant (IMO) is that IP doen't care about the layers below it.
> It can be plugged into any LAN/WAN structure. But in the lowest layer in
> your ASCII art there is still the seperation of the physical properties of
> your medium (like electrical or optical properties) and link layer data
> transfer (like framing, encoding, ...). Another reason for me to believe
> that IP is at the third layer is the terminologies like "layer three
> switching", L2TP ...

That's correct, and that terminology refers to the 7-layer OSI networking 
model, where the Application layer is layer 7.   Agreed, hardly anyone knows 
what layers 5 and 6 are for in that model, but it's still a 7-layer model all 
the same.

There is no 5-layer networking model as far as I'm aware.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

