From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: per connection...
Date: Mon, 25 Aug 2003 16:39:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308251639.42394.gdh@acentral.co.uk>
References: <3F4A21E4.3010203@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4A21E4.3010203@o2.pl>
Content-Disposition: inline
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Monday 25 August 2003 15:49, Krystian wrote:
> is there a way to count bytes per single connection?

I think what you want is provided by the 'NetFlow' system usually implemented 
in Cisco products.

There are a number of 'probes' for Linux which do the same thing.... google / 
search freshmeat.net for 'netflow' for more information.

Cheers,
Gavin,


