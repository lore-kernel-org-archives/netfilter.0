From: Goetz Bock <netfilter@blacknet.de>
Subject: Re: TFTP connection tracking problem
Date: Tue, 11 Nov 2003 00:51:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031110235147.GK11702@shell.blacknet.de>
References: <3FAFA135.9050707@draigBrady.com> <3FAFB747.4090005@draigBrady.com> <20031110175435.GC22483@cannon.eng.us.uu.net> <3FAFCA3A.1060008@draigBrady.com> <20031110195332.GD22483@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031110195332.GD22483@cannon.eng.us.uu.net>
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


On Mon, Nov 10 '03 at 14:53, Ramin Dousti wrote:
> > >You need ip_conntrack_tftp and ip_nat_tftp helper modules.
> > Great. So how do I download it?
> Well, good question. A quick scan through the latest pom didn't show
> anything.
http://www.<your_mirror>.kernel.org/pub/linux/kernel/v2.4/linux-2.4.22.tar.bz2
e.g. part of stock 2.4.22
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]

