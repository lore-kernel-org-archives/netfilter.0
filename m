From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec Transport Mode
Date: Wed, 7 Jul 2004 22:42:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407072242.09330.Antony@Soft-Solutions.co.uk>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de> <200407072154.52923.Antony@Soft-Solutions.co.uk> <20040707211122.GA15747@zion.homelinux.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040707211122.GA15747@zion.homelinux.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 07 July 2004 10:11 pm, Sven Schuster wrote:

> Hi Antony,
>
> On Wed, Jul 07, 2004 at 09:54:52PM +0100, Antony Stone told us:
> > ESP is for tunnel mode, and works fine through NAT.
> >
> > Transport mode uses AH (protocol 51), and that's the one which breaks
> > through NAT.
>
> Isn't using AH or ESP independent from tunnel/transport mode?? AH
> mode is just authentication, ESP is authentication + encryption. You
> can use AH with tunnel mode and ESP with transport mode like you
> wish I think.

Hm, not sure about this - I've never wanted a VPN without encryption, so I've 
not experimented with AH tunnels.

Also, if you can do transport mode with ESP, then it should work through NAT 
without problems, because the original packet gets encapsulated (as per my 
previous explanation).

Regards,

Antony.

-- 
"There is no reason for any individual to have a computer in their home."

 - Ken Olsen, President of Digital Equipment Corporation (DEC, later consumed 
by Compaq, later merged with HP)

                                                     Please reply to the list;
                                                           please don't CC me.


