From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Arbitrary Netmasks
Date: Tue, 28 May 2002 20:45:13 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205282045.14015@henrik.marasystems.com>
References: <5.1.1.2.2.20020528150443.00b9ad58@ns.rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <5.1.1.2.2.20020528150443.00b9ad58@ns.rnl.ist.utl.pt>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Filipe Almeida <filipe@rnl.ist.utl.pt>, Thomas Heinz <josef.k@mytomorrow.de>
Cc: netfilter-devel@lists.samba.org, netfilter@lists.samba.org

Which is not generally a valid thing to assume.. the .255 and/or .0 
address may be in use on larger networks, especially if addresses are 
assigned dynamically using a large DHCP scope..


On Tuesday 28 May 2002 16:07, Filipe Almeida wrote:
> I usually use:
>
> iptables -A FORWARD -s 0.0.0.255/0.0.0.255 -j DROP
> iptables -A FORWARD -d 0.0.0.255/0.0.0.255 -j DROP
> iptables -A FORWARD -s 0.0.0.0/0.0.0.255 -j DROP
> iptables -A FORWARD -d 0.0.0.0/0.0.0.255 -j DROP
>
> to stop routing of broadcasted packets. This works assuming you
> only have 256 sized classes.


