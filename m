From: "Joey" <Joey@Web56.net>
Subject: RE: netblock.py line 109
Date: Thu, 23 Oct 2008 02:21:34 -0400
Message-ID: <004b01c934d7$98bd0ff0$ca372fd0$@net>
References: <OFB2C9107C.7BC96E03-ON862574EA.00735C73-862574EA.00736AC4@uscmail.uscourts.gov> <004501c93496$8e7b8c10$ab72a430$@net> <OF0767CEE0.A50C3667-ON862574EA.007C7333-862574EA.007CB941@uscmail.uscourts.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <OF0767CEE0.A50C3667-ON862574EA.007C7333-862574EA.007CB941@uscmail.uscourts.gov>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

> -----Original Message-----
> From: Greg_Swift@aotx.uscourts.gov [mailto:Greg_Swift@aotx.uscourts.gov]
> Sent: Wednesday, October 22, 2008 6:42 PM
> To: Joey
> Subject: RE: netblock.py line 109
> 
> >
> > That was quick ;)
> > I didn't see this message right after the other.
> > Just an FYI it worked from an error perspective, but it didn't find
> > what block it came from when I searched several IP's.
> >
> > I put the file here http://web56.net/test.txt
> >
> > And I basically ran this:
> > ./netblock.py test.txt 58.180.27.3
> >
> > Line 27 contains the 58.180.0.0 ip block.
> >
> > Thanks!
> >
> 
> In that case here is an updated version of netblock.py that does all of
it,
> and i just tested it, it works.
> 
> -greg(See attached file: netblock.py)

Greg,

Thanks a million the script looks like it works!
The funny thing is I can't figure out where we are blocking 71.74.56.125
from, our log says were blocking it, but the CIDR IP's says no.
I did test several IP's from the blocks against your script and it worked
great!

Thanks again for taking your time to do this!

Joey


