From: Goetz Bock <netfilter@blacknet.de>
Subject: Re: conntrack for samba/netbios-ns
Date: Wed, 5 Nov 2003 03:58:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031105025846.GB11702@shell.blacknet.de>
References: <20031105003401.GA11702@shell.blacknet.de> <1067999419.7813.38.camel@tarkus>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1067999419.7813.38.camel@tarkus>
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
To: netfilter <netfilter@lists.netfilter.org>


On Tue, Nov 04 '03 at 21:30, Ted Kaczmarek wrote:
> udp is connectionless, not sure where you can get a state on it.
Just because the udp is connectionless, does not mean you can not track
the "state" of a "connection" between two machines.

> I am actually surprised that the udp lines with state even took
> or do they only show up on the script.
Yes they do work. Have a look at /proc/net/ip_conntrack.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]

