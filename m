From: seberino@spawar.navy.mil
Subject: Re: Need diagram on *order* IP packet traverses iptables 'tables'
Date: Thu, 20 Jan 2005 16:56:06 -0800
Message-ID: <20050121005606.GC1626@spawar.navy.mil>
References: <7C9884991ADAE0479C14F10C858BCDF5679673@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5679673@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

THANKS!

CS

On Thu, Jan 20, 2005 at 04:10:36PM -0800, Daniel Chemko wrote:
> seberino@spawar.navy.mil wrote:
> > I am looking for a diagram to remind me of path
> > a NAT'ed IP packet takes thru all the iptables tables
> > when it goes from Internet to a private firewalled PC and vice versa.
> >
> > e.g. What order does packet traverse INCOMING, FORWARD, PREROUTING,
> > POSTROUTING guys?
> >
> > Chris
>
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSING
> OFTABLES
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

