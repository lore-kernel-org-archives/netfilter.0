From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: ip_conntrack: table full, dropping packet. - Anyone????? Frustrating!
Date: Mon, 3 Jun 2002 10:46:27 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603104627.Q27307@funkyjesus.org>
References: <2781.24.168.132.35.1023074731.squirrel@mail.vistawiz.com>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <2781.24.168.132.35.1023074731.squirrel@mail.vistawiz.com>; from smalik@vistawiz.com on Sun, Jun 02, 2002 at 11:25:31PM -0400
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Sun, Jun 02, 2002 at 11:25:31PM -0400, Shazad Malik wrote:

> I have seen other explanations such as incresing your tcp max number as
> your physical mem. increase.  Check you /proc/net/ip_conntrack file for the
> current connections.  But none of these factors have anything to do with
> this error.  I have only 2 connections, doing regular HTTP gets and its
> filling my log file:
> 
> Jun  2 09:50:39 new kernel: ip_conntrack: table full, dropping packet.
> Jun  2 09:53:29 new kernel: ip_conntrack: table full, dropping packet.
> Jun  2 09:57:14 new kernel: ip_conntrack: table full, dropping packet.

What's the output of

cat /proc/net/ip_conntrack 

look like?

-- 
FunkyJesus System Administration Team


