From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: general policy question
Date: Fri, 7 Jun 2002 16:23:06 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206071523.g57FNGA02439@vulcan.rissington.net>
References: <B9263CED.1C96%patrick@wechsler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <B9263CED.1C96%patrick@wechsler.com>
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
To: netfilter@lists.samba.org

On Friday 07 June 2002 3:35 pm, patrick conlin wrote:

> does one generally set the -P on their mangle table chains to DROP, even if
> you're not using them for anything?

No.   Mangle tables are for mangling.   Nat tables are for address 
translating, and Filter tables are for filtering.   DROP is a filter 
operation, therefore it belongs only in the filter tables.

> usual procedure says set -P on all chains to DROP and allow what's
> necessary,

Yes, but that's just being being sloppy in their description and not saying 
"all chains in the filter table"...

> but if you're not using your mangle table chains for anything
> and you set -P to DROP (on the iptables -t mangle PREROUTING chain, for
> example) all packets get dropped.

Yes :-)

The reason ?   All packets have to pass through the mangle, nat and filter 
tables in order to traverse the entire system.   If any one of those tables 
DROPsthe packet, that's it - it's DROPped !

> Just wondering how everyone else handles this.

Don't try to filter using the mangle table :-)


Antony.

