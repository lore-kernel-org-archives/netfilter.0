From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp forward to internal machine
Date: Tue, 4 Jun 2002 23:38:38 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042238.g54MceA10923@Networker.rockstone.co.uk>
References: <Pine.LNX.4.44.0206041531190.30454-100000@wookie.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206041531190.30454-100000@wookie.shorewall.net>
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
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Tuesday 04 June 2002 11:32 pm, Tom Eastep wrote:

> On Tue, 4 Jun 2002, Antony Stone wrote:

> > You're almost certainly using "-m state --state RELATED" to handle port
> > 20 for you.   Isn't stateful inspection wonderful :-)

> And also loading ip_conntrack_ftp.o and ip_nat_ftp.o.

Well, yes, that's where your stateful inspection comes in, innit ?   :-)


Antony.

