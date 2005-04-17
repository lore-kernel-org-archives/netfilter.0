From: seberino@spawar.navy.mil
Subject: Re: Cleanest way to deal with loopback interface?
Date: Sun, 17 Apr 2005 16:27:09 -0700
Message-ID: <20050417232709.GA28390@spawar.navy.mil>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
	<20050413211349.GA31336@bender.817west.com>
	<425DC2DA.7010608@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <425DC2DA.7010608@riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org


How allow just legitimate loopback traffic then?

Chris

On Wed, Apr 13, 2005 at 08:09:46PM -0500, Taylor Grant wrote:
> >allow traffic on the loopback interface unconditionally,  and allow the
> >linux routing code 'martian' checks to drop 127.0.0.0/8 packets received
> >'on the wire' as it does by default.
>
> I don't think this is such a good idea.  I could reconfigure my system such
> that it's loop back interface was not in the 127.0.0.0/8 network and set a
> route to the 127.0.0.0/8 network to be via your IP on the LAN.  Assuming
> that your system and my system were on the same LAN and subnet and we could
> ping each other I would be able to access your 127.0.0.1 address as your
> kernel would forward traffic to the loop back network in your system.
>
>
>
> Grant. . . .
>

--
_______________________________________

Christian Seberino, Ph.D.
SPAWAR Systems Center San Diego
Code 2872
49258 Mills Street, Room 158
San Diego, CA 92152-5385
U.S.A.

Phone: (619) 553-9973
Fax  : (619) 553-6521
Email: seberino@spawar.navy.mil
_______________________________________

