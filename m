From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcpdump and netfilter
Date: Fri, 14 Jun 2002 17:54:25 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206141654.RAA13159@slate.rockstone.co.uk>
References: <y9sbsadzuai.fsf@pc-024.diku.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <y9sbsadzuai.fsf@pc-024.diku.dk>
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

On Friday 14 June 2002 5:42 pm, Jacob Hansen wrote:

> I am writing a packet mangling kernel module and tcpdump reports very
> odd-looking IP packets, that i cannot seem to pinpoint at any nf_hook.

Yes - I've come across this before as well.   I'm not sure there's a singel 
reliable solution to combine these two applications.

> Any suggestions as to a debugging approach?

1. Use netfilter LOGging to output packets you want to monitor.

2. Run tcpdump / ethereal etc on another machine to show you what comes out 
of the network interface onto the wire.

Can anyone else suggest a way to do it reliably on one machine ?

 

Antony.

