From: "Ed Street" <blacknet@simplyaquatics.com>
Subject: RE: hosts.deny
Date: Sun, 7 Jul 2002 19:33:22 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <006d01c2260e$aec0be20$0a01a8c0@ed>
References: <200FAA488DE0D41194F10010B597610D2BA265@JUPITER>
Reply-To: <blacknet@simplyaquatics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA265@JUPITER>
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

Hello,

I've taken the hosts.deny file a bit further and wrote a hosts.trashcan
and a hosts.dnat.

The hosts.trashcan uses the time patch, it will reject any ip/netmask
from start_time to end_time on days.

The hosts.dnat file will setup a dnat rule, it's format is 
Sport	ip	dport	protocol

Ed



