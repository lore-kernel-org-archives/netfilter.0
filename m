From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forcefully closing TCP connections
Date: Mon, 16 Sep 2002 21:39:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020916203942.PRCL17905.mta07-svc.ntlworld.com@there>
References: <20020916201911.GU3540@bbn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020916201911.GU3540@bbn.com>
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

On Monday 16 September 2002 9:19 pm, Michael Atighetchi wrote:

> I'd like to forcefully close TCP connections out of band under Linux
> 2.4 - does anyone know how to do this ?
>
> Imagine:
>
>  Client <ip1, p1> -----> Server <ip2,pX>
>  Client <ip1, p2> -----> Server <ip2,pX>
>      ...
>  Client <ip1, p100> ---> Server <ip2,pX>
>
> I'm looking for an easy way to close (TCP RST?) all hundred
> connections without touching client / server code. Assume that I have
> sudo permissions to any command on Server.

Try tcpkill, part of the dsniff suite of password sniffing / network cracking 
- oops, sorry, that should say network administration tools - from Dug Song:

http://monkey.org/~dugsong/dsniff

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

