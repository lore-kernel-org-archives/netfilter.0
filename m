From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: IPTABLES vs Checkpoint
Date: Wed, 27 Nov 2002 12:06:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127120629.G14289@funkyjesus.org>
References: <3F5BAB933C75004690195047C4040A6D0535DC@tc-pdc.jhbA.techconcepts.co.za>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F5BAB933C75004690195047C4040A6D0535DC@tc-pdc.jhbA.techconcepts.co.za>; from wdenobre@techconcepts.co.za on Wed, Nov 27, 2002 at 08:45:08AM +0200
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
To: netfilter@lists.netfilter.org

On Wed, Nov 27, 2002 at 08:45:08AM +0200, Wayne de Nobrega wrote:

> In my specific case, this company is already running the Nokia solution.
> For the office in my country, the local office does not want to incur the
> cost of $7,000 (excluding ongoing licence costs) to install the solution
> when they can install the IPTABLES version for the equivalent of $1,000
> (h/w, s/w and installation).
> 
> The local firewall will be managed locally and has very simply rules in
> place as they are not running any services behind the firewall. They
> will also not be running any VPN.  It is simply for connecting the local
> office to the Internet, not to corporate.

As long as it's always the local office running the firewall I don't see a
problem with this.  Make sure you've got good hardware support contracts
though, or at least one spare box kicking around, as one of the benefits of
the Checkpoint / Nokia solution is the s/w and h/w support.

> Do you have any more info which explains the architecture of the Nokia
> IP330 and Checkpoint solution so that I can do a more technical comparison
> between the two products.  The information on the Nokia site is typical
> marketing.  I believe the Nokia product runs a customised version of
> FreeBSD.

Your best bet is to contact your local Checkpoint reseller, they will fall
over themselves to provide you with information.

<snip>

-- 
FunkyJesus System Administration Team


