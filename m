From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: Re: Arbitrary Netmasks
Date: Wed, 29 May 2002 10:57:14 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.1.2.2.20020529105459.00b7a798@ns.rnl.ist.utl.pt>
References: <5.1.1.2.2.20020528150443.00b9ad58@ns.rnl.ist.utl.pt>
 <5.1.1.2.2.20020528150443.00b9ad58@ns.rnl.ist.utl.pt>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200205282045.14015@henrik.marasystems.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Henrik Nordstrom <hno@marasystems.com>
Cc: Thomas Heinz <josef.k@mytomorrow.de>, netfilter-devel@lists.samba.org, netfilter@lists.samba.org

True.
I attach interface (-i/-o) matches so I will only filter my networks. I 
wrote those lines of the top of my head so I forgot the -i/-o.

At 20:45 28-05-2002 +0200, Henrik Nordstrom wrote:
>Which is not generally a valid thing to assume.. the .255 and/or .0
>address may be in use on larger networks, especially if addresses are
>assigned dynamically using a large DHCP scope..
>
>
>On Tuesday 28 May 2002 16:07, Filipe Almeida wrote:
> > I usually use:
> >
> > iptables -A FORWARD -s 0.0.0.255/0.0.0.255 -j DROP
> > iptables -A FORWARD -d 0.0.0.255/0.0.0.255 -j DROP
> > iptables -A FORWARD -s 0.0.0.0/0.0.0.255 -j DROP
> > iptables -A FORWARD -d 0.0.0.0/0.0.0.255 -j DROP
> >
> > to stop routing of broadcasted packets. This works assuming you
> > only have 256 sized classes.


