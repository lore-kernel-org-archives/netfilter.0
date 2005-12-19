From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Firewall and a FTP server (nfcan: addressed to exclusive sender
	for this address)
Date: Mon, 19 Dec 2005 10:15:48 -0500
Message-ID: <20051219151548.GA31194@salty>
References: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
	(from
	+nfcan+jimlaur+4ee21c4004.tac.forums#gmail.com@spamgourmet.com
	on Mon, Dec 19, 2005 at 06:52:12 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.12.19 06:52, TAC Forums - tac.forums@gmail.com wrote:
> Hi All,
> 
> We have a FTP server, (Red Hat Linux 7) behind a firewall, the
> firewall allows only incomming and established connections on ports
> 20,21  from any where and evry where.
> 
> The Problem is, when the customers use FTP clients, the manage to
> login , but cannot upload/download files if they use PASSIVE FTP
> connections.
> 
> Can smeone suggest, how the best way to get out of this situation,
> should we enable all ports above 1023?

Besides loading the modules, as already discussed,
you need to change the filter rules to allow
not only ESTABLISHED but also RELATED connections.
This eliminates the need to open all the high ports.
The new rule would look something like this:

$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

