From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: How does a NAT-packet traverse?
Date: Fri, 14 Mar 2003 09:10:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C48@hslex01.hslbz.local>
References: <20030314070154.5FDA81CFB5E00@sm203.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030314070154.5FDA81CFB5E00@sm203.163.com>
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
To: netfilter@lists.netfilter.org

> Will these packets pass through INPUT chains and go 
> out from OUT chains?and  they are changed at the local process ?

No, the INPUT and OUTPUT are chains *only* used by the local iptables
machine.
FORWARD is the chain used by PC's on your lan.

> I am puzzled now .

Did you look in the iptables tutorial (chapter 3) ?
http://iptables-tutorial.frozentux.net/

There is an explanation with pic in it.


Rob


