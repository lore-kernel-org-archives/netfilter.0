From: Shawn <core@enodev.com>
Subject: RE: Is this correct?
Date: 19 Jun 2003 21:35:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056076546.14133.13.camel@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF5122DDF@alderaan.smgtec.com>
	 <1056076228.14138.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1056076228.14138.8.camel@localhost>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Err.. No, duh... linux-router/eth0 has 10.0.0.250...

But if the packet becomes destined for 192.168.0.1 in PREROUTING, would
then the routing decision be based on the 192.168.0.1 address, and since
eth1 has an IP of 192.268.0.250/24, would the packet not get forwarded
out there?

On Thu, 2003-06-19 at 21:30, Shawn wrote:
> It wouldn't throw it away if it had a route for it, would it?
> 
> Since linux-router/eth1 has 10.0.0.250/24 assigned, wouldn't it forward
> out that one?


